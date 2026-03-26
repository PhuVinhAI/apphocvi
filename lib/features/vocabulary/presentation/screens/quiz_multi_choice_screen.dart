import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../data/models/word_model.dart';

class QuizMultiChoiceScreen extends StatefulWidget {
  final WordModel word;

  const QuizMultiChoiceScreen({super.key, required this.word});

  @override
  State<QuizMultiChoiceScreen> createState() => _QuizMultiChoiceScreenState();
}

class _QuizMultiChoiceScreenState extends State<QuizMultiChoiceScreen> {
  String? _selectedChoice;
  bool _isSubmitted = false;
  late List<String> _choices;

  @override
  void initState() {
    super.initState();
    _choices = widget.word.choices.isNotEmpty 
        ? widget.word.choices.toList() 
        : [
            widget.word.definition, 
            'Mock wrong answer 1', 
            'Mock wrong answer 2', 
            'Mock wrong answer 3'
          ];
    _choices.shuffle();
  }

  void _onChoiceSelected(String choice) {
    if (_isSubmitted) return;
    setState(() {
      _selectedChoice = choice;
    });
  }

  void _submit() {
    if (_selectedChoice == null || _isSubmitted) return;
    setState(() { _isSubmitted = true; });
    
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.push('/vocab/quiz-fill', extra: widget.word);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                      'Choose the right meaning for:',
                      style: AppTokens.textLg.copyWith(color: AppTokens.textSecondary, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppTokens.spaceLg),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.word.word,
                        style: AppTokens.text3xl.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppTokens.textPrimary, // Stark black
                          fontSize: 64,
                          letterSpacing: -1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ..._choices.map((choice) => _buildFlatChoice(choice)),
                  ],
                ),
              ),
            ),

            // Flat Bottom Action
            Container(
              padding: const EdgeInsets.all(AppTokens.spaceLg),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AppTokens.surfaceVariant)),
              ),
              child: ElevatedButton(
                onPressed: _selectedChoice != null && !_isSubmitted ? _submit : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTokens.textPrimary,
                  foregroundColor: AppTokens.surface,
                  disabledBackgroundColor: AppTokens.surfaceVariant,
                  disabledForegroundColor: AppTokens.textTertiary,
                  padding: const EdgeInsets.symmetric(vertical: AppTokens.spaceLg),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppTokens.radiusFull)),
                  elevation: 0,
                ),
                child: Text(
                  _isSubmitted ? 'Checking...' : 'Check Answer',
                  style: AppTokens.textLg.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFlatChoice(String choice) {
    final isSelected = _selectedChoice == choice;
    final isCorrect = choice == widget.word.definition;
    
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
