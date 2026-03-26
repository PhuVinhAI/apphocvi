import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../data/models/word_model.dart';

class QuizFillBlankScreen extends StatefulWidget {
  final WordModel word;

  const QuizFillBlankScreen({super.key, required this.word});

  @override
  State<QuizFillBlankScreen> createState() => _QuizFillBlankScreenState();
}

class _QuizFillBlankScreenState extends State<QuizFillBlankScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isSubmitted = false;
  bool _isCorrect = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_controller.text.isEmpty || _isSubmitted) return;
    
    setState(() {
      _isSubmitted = true;
      _isCorrect = _controller.text.trim().toLowerCase() == widget.word.word.toLowerCase();
    });
    
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        context.push('/vocab/complete', extra: widget.word);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String sentence = "____ là một từ rất hay.";
    if (widget.word.exampleSentences.isNotEmpty) {
      final String original = widget.word.exampleSentences.first;
      sentence = original.replaceAll(RegExp(widget.word.word, caseSensitive: false), '____');
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
                      sentence,
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
                      style: AppTokens.text2xl.copyWith(fontWeight: FontWeight.bold, color: AppTokens.textPrimary),
                      textAlign: TextAlign.center,
                      onChanged: (value) => setState(() {}),
                      onSubmitted: (_) => _submit(),
                    ),
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
                onPressed: _controller.text.isNotEmpty && !_isSubmitted ? _submit : null,
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
}
