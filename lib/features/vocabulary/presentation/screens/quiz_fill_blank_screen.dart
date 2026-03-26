import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../data/models/word_model.dart';
import '../providers/learning_session_provider.dart';

class QuizFillBlankScreen extends ConsumerStatefulWidget {
  final WordModel word;

  const QuizFillBlankScreen({super.key, required this.word});

  @override
  ConsumerState<QuizFillBlankScreen> createState() => _QuizFillBlankScreenState();
}

class _QuizFillBlankScreenState extends ConsumerState<QuizFillBlankScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isSubmitted = false;
  bool _isCorrect = false;
  
  late String _sentence;
  late String _correctAnswer;

  @override
  void initState() {
    super.initState();
    _sentence = "____ là một từ rất hay.";
    _correctAnswer = widget.word.word;
    
    final fq = widget.word.fillBlankQuiz;
    if (fq != null && fq.isNotEmpty) {
       _sentence = fq['question']?.toString() ?? fq['sentence']?.toString() ?? _sentence;
       _correctAnswer = fq['correctAnswer']?.toString() ?? fq['answer']?.toString() ?? widget.word.word;
    } else if (widget.word.exampleSentences.isNotEmpty) {
      final String original = widget.word.exampleSentences.first;
      _sentence = original.replaceAll(RegExp(widget.word.word, caseSensitive: false), '____');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_isSubmitted) {
      if (mounted) context.push('/vocab/complete', extra: widget.word);
      return;
    }
    if (_controller.text.isEmpty) return;
    
    setState(() {
      _isSubmitted = true;
      _isCorrect = _controller.text.trim().toLowerCase() == _correctAnswer.toLowerCase();
    });
    
    ref.read(learningSessionProvider.notifier).recordAnswer(_isCorrect);
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic floating button styling based on state
    Color btnColor = AppTokens.textPrimary;
    Color btnTextColor = AppTokens.surface;
    String btnText = 'Check Answer';
    
    if (_isSubmitted) {
      btnColor = _isCorrect ? AppTokens.success : AppTokens.error;
      btnText = 'Next';
    } else if (_controller.text.isEmpty) {
      btnColor = AppTokens.surfaceVariant;
      btnTextColor = AppTokens.textTertiary;
    }

    return Scaffold(
      backgroundColor: AppTokens.surface,
      appBar: AppBar(
        title: Text('Quiz 2 / 2', style: AppStyles.h3()),
        backgroundColor: AppTokens.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: AppTokens.textPrimary),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: () => context.push('/vocab/complete', extra: widget.word),
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
              child: FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: 0.8,
                child: Container(color: AppTokens.primary),
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: AppTokens.spaceLg, vertical: AppTokens.space2xl),
                child: Column(
                  children: [
                    Text(
                      'Type the missing word:',
                      style: AppTokens.textLg.copyWith(color: AppTokens.textSecondary, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppTokens.space2xl),
                    Text(
                      _sentence,
                      style: AppTokens.text3xl.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTokens.textPrimary,
                        height: 1.3,
                        letterSpacing: -0.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppTokens.space2xl),
                    
                    TextField(
                      controller: _controller,
                      enabled: !_isSubmitted,
                      decoration: InputDecoration(
                        hintText: 'Your answer',
                        hintStyle: TextStyle(color: AppTokens.textTertiary),
                        filled: true,
                        fillColor: AppTokens.background,
                        contentPadding: const EdgeInsets.symmetric(horizontal: AppTokens.spaceXl, vertical: AppTokens.spaceLg),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppTokens.radiusFull),
                          borderSide: BorderSide(color: AppTokens.surfaceVariant, width: 1.5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppTokens.radiusFull),
                          borderSide: BorderSide(color: AppTokens.surfaceVariant, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppTokens.radiusFull),
                          borderSide: const BorderSide(color: AppTokens.primary, width: 2),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(AppTokens.radiusFull),
                          borderSide: BorderSide(
                            color: _isSubmitted ? (_isCorrect ? AppTokens.success : AppTokens.error) : AppTokens.surfaceVariant, 
                            width: 2
                          ),
                        ),
                        suffixIcon: _isSubmitted
                            ? Padding(
                                padding: const EdgeInsets.only(right: AppTokens.spaceLg),
                                child: Icon(
                                  _isCorrect ? LucideIcons.checkCircle2 : LucideIcons.xCircle,
                                  color: _isCorrect ? AppTokens.success : AppTokens.error,
                                  size: 28,
                                ),
                              )
                            : null,
                      ),
                      style: AppTokens.text2xl.copyWith(
                        fontWeight: FontWeight.bold, 
                        color: _isSubmitted ? (_isCorrect ? AppTokens.success : AppTokens.error) : AppTokens.textPrimary
                      ),
                      textAlign: TextAlign.center,
                      onChanged: (value) => setState(() {}),
                      onSubmitted: (_) => _submit(),
                    ),
                    
                    if (_isSubmitted && !_isCorrect) ...[
                      const SizedBox(height: AppTokens.spaceLg),
                      Text(
                        'Correct answer: $_correctAnswer',
                        style: AppTokens.textLg.copyWith(
                          color: AppTokens.success,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                    
                    const SizedBox(height: 100), // Spacing for floating button
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
            onPressed: (_controller.text.isNotEmpty) ? _submit : null,
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
}
