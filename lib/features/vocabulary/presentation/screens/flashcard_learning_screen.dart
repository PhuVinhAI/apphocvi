import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../../core/theme/app_tokens.dart';
import '../../data/models/word_model.dart';

class FlashcardLearningScreen extends StatefulWidget {
  final WordModel word;

  const FlashcardLearningScreen({super.key, required this.word});

  @override
  State<FlashcardLearningScreen> createState() => _FlashcardLearningScreenState();
}

class _FlashcardLearningScreenState extends State<FlashcardLearningScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isFront = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCubic),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _flipCard() {
    if (_isFront) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    setState(() {
      _isFront = !_isFront;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTokens.primary, // Immersive solid color background
      body: SafeArea(
        child: Column(
          children: [
            // Minimal Header
            Padding(
              padding: const EdgeInsets.all(AppTokens.spaceLg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 28),
                    onPressed: () => context.pop(),
                  ),
                  TextButton(
                    onPressed: () {
                      context.push('/vocab/examples', extra: widget.word);
                    },
                    child: Text(
                      'Next',
                      style: AppTokens.textLg.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            // Full screen active area
            Expanded(
              child: GestureDetector(
                onTap: _flipCard,
                behavior: HitTestBehavior.translucent,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final angle = _animation.value * pi;
                    final isUnder = angle > pi / 2;

                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001) // perspective
                        ..rotateX(angle), // Flip vertically is often cooler on mobile full screen
                      alignment: Alignment.center,
                      child: isUnder 
                        ? Transform(
                            transform: Matrix4.identity()..rotateX(pi),
                            alignment: Alignment.center,
                            child: _buildBackContent(),
                          )
                        : _buildFrontContent(),
                    );
                  },
                ),
              ),
            ),
            
            // Interaction Hint
            Padding(
              padding: const EdgeInsets.only(bottom: AppTokens.space2xl),
              child: Text(
                'Tap anywhere to flip',
                style: AppTokens.textBase.copyWith(
                  color: Colors.white70,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrontContent() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppTokens.space2xl),
      alignment: Alignment.center,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          widget.word.word,
          style: AppTokens.text3xl.copyWith(
            fontWeight: FontWeight.w900,
            color: Colors.white,
            fontSize: 80,
            letterSpacing: -2.0,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildBackContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTokens.space2xl,
                vertical: AppTokens.space2xl,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // The word (As a reminder pill on top)
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTokens.spaceLg,
                        vertical: AppTokens.spaceSm,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(AppTokens.radiusFull),
                      ),
                      child: Text(
                        widget.word.word,
                        style: AppTokens.textBase.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppTokens.space2xl),

                  // Main Translation / Definition
                  Text(
                    widget.word.definition,
                    style: AppTokens.text3xl.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 48,
                      height: 1.2,
                      letterSpacing: -1.0,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  if (widget.word.notes != null && widget.word.notes!.isNotEmpty) ...[
                    const SizedBox(height: 60), // Generous spacing before notes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(LucideIcons.lightbulb, color: Colors.white70, size: 20),
                        const SizedBox(width: AppTokens.spaceSm),
                        Text(
                          'NOTES',
                          style: AppTokens.textSm.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppTokens.spaceMd),
                    Text(
                      widget.word.notes!,
                      style: AppTokens.textXl.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
