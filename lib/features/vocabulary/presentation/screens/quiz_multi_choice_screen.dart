import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../data/models/word_model.dart';
import '../providers/learning_session_provider.dart';

class QuizMultiChoiceScreen extends ConsumerStatefulWidget {
  final WordModel word;

  const QuizMultiChoiceScreen({super.key, required this.word});

  @override
  ConsumerState<QuizMultiChoiceScreen> createState() => _QuizMultiChoiceScreenState();
}

class _QuizMultiChoiceScreenState extends ConsumerState<QuizMultiChoiceScreen> {
  String? _selectedChoice;
  bool _isSubmitted = false;
  
  late List<String> _choices;
  late String _question;
  late String? _highlightWord;
  late String _correctAnswer;

  @override
  void initState() {
    super.initState();
    final mq = widget.word.multiChoiceQuiz;
    if (mq != null && mq.isNotEmpty) {
      _question = mq['question']?.toString() ?? 'Choose the right meaning:';
      if (mq['options'] is List) {
        _choices = List<String>.from(mq['options'] as List);
      } else {
        _choices = widget.word.choices.isNotEmpty ? widget.word.choices.toList() : [];
      }
      _correctAnswer = mq['correctAnswer']?.toString() ?? mq['answer']?.toString() ?? widget.word.definition;
      _highlightWord = null;
    } else {
      _question = 'Choose the right meaning for:';
      _highlightWord = widget.word.word;
      _choices = widget.word.choices.isNotEmpty 
          ? widget.word.choices.toList() 
          : [widget.word.definition, 'Mock answer 1', 'Mock answer 2'];
      _correctAnswer = widget.word.definition;
    }

    if (_choices.isEmpty) {
      _choices = [_correctAnswer, 'Mock 1', 'Mock 2', 'Mock 3'];
    }

    if (!_choices.contains(_correctAnswer)) {
      _choices.add(_correctAnswer);
    }
    _choices.shuffle();
  }

  void _onChoiceSelected(String choice) {
    if (_isSubmitted) return;
    setState(() {
      _selectedChoice = choice;
    });
  }

  void _submit() {
    if (_isSubmitted) {
      // If already submitted, navigate to next screen
      if (mounted) context.push('/vocab/quiz-fill', extra: widget.word);
      return;
    }
    if (_selectedChoice == null) return;
    
    final isCorrect = _selectedChoice == _correctAnswer;
    ref.read(learningSessionProvider.notifier).recordAnswer(isCorrect);

    setState(() { _isSubmitted = true; });
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic floating button styling based on state
    Color btnColor = AppTokens.textPrimary;
    Color btnTextColor = AppTokens.surface;
    String btnText = 'Check Answer';
    
    if (_isSubmitted) {
      final isCorrect = _selectedChoice == _correctAnswer;
      btnColor = isCorrect ? AppTokens.success : AppTokens.error;
      btnText = 'Next';
    } else if (_selectedChoice == null) {
      btnColor = AppTokens.surfaceVariant;
      btnTextColor = AppTokens.textTertiary;
    }

    return Scaffold(
      backgroundColor: AppTokens.surface, // Flat white
      appBar: AppBar(
        title: Text('Quiz 1 / 2', style: AppStyles.h3()),
        backgroundColor: AppTokens.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: AppTokens.textPrimary),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () => context.push('/vocab/quiz-fill', extra: widget.word),
            child: Text('Skip', style: AppTokens.textBase.copyWith(color: AppTokens.textSecondary, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Flat Progress Line
            Container(height: 4, width: double.infinity, color: AppTokens.surfaceVariant,
              child: FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: 0.6,
                child: Container(color: AppTokens.primary),
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTokens.spaceLg, vertical: AppTokens.space2xl),
                child: Column(
                  children: [
                    Text(
                      _question,
                      style: AppTokens.textLg.copyWith(color: AppTokens.textSecondary, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    if (_highlightWord != null) ...[
                      const SizedBox(height: AppTokens.spaceLg),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _highlightWord!,
                          style: AppTokens.text3xl.copyWith(
                            fontWeight: FontWeight.w900,
                            color: AppTokens.textPrimary, // Stark black
                            fontSize: 64,
                            letterSpacing: -1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    const SizedBox(height: 40),
                    ..._choices.map((choice) => _buildFlatChoice(choice)),
                    const SizedBox(height: 100), // Space for floating button
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppTokens.spaceXl),
        child: SizedBox(
          width: double.infinity,
          height: 64,
          child: ElevatedButton(
            onPressed: (_selectedChoice != null) ? _submit : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: btnColor,
              foregroundColor: btnTextColor,
              disabledBackgroundColor: AppTokens.surfaceVariant,
              disabledForegroundColor: AppTokens.textTertiary,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTokens.radiusFull)),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  btnText,
                  style: AppTokens.textXl.copyWith(fontWeight: FontWeight.bold),
                ),
                if (_isSubmitted) ...[
                  const SizedBox(width: AppTokens.spaceMd),
                  const Icon(LucideIcons.arrowRight),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFlatChoice(String choice) {
    final isSelected = _selectedChoice == choice;
    final isCorrect = choice == _correctAnswer;
    
    Color borderColor = AppTokens.surfaceVariant;
    Color bgColor = Colors.transparent;
    Color iconColor = Colors.transparent;
    IconData icon = LucideIcons.circle;

    if (_isSubmitted) {
      if (isCorrect) {
        borderColor = AppTokens.success;
        bgColor = AppTokens.success.withValues(alpha: 0.1);
        iconColor = AppTokens.success;
        icon = LucideIcons.checkCircle2;
      } else if (isSelected && !isCorrect) {
        borderColor = AppTokens.error;
        bgColor = AppTokens.error.withValues(alpha: 0.1);
        iconColor = AppTokens.error;
        icon = LucideIcons.xCircle;
      }
    } else if (isSelected) {
      borderColor = AppTokens.primary;
      bgColor = AppTokens.primary.withValues(alpha: 0.05);
      iconColor = AppTokens.primary;
      icon = LucideIcons.checkCircle2;
    }

    return GestureDetector(
      onTap: () => _onChoiceSelected(choice),
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppTokens.spaceMd),
        padding: const EdgeInsets.all(AppTokens.spaceXl),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppTokens.radiusMd),
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1.5),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor),
            if (iconColor != Colors.transparent) const SizedBox(width: AppTokens.spaceMd),
            Expanded(
              child: Text(
                choice,
                style: AppTokens.textLg.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: AppTokens.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
