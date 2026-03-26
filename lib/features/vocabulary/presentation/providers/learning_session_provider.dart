import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/word_model.dart';

class LearningSessionState {
  final WordModel? currentWord;
  final int totalQuestions;
  final int correctAnswers;
  final int xpGained;

  const LearningSessionState({
    this.currentWord,
    this.totalQuestions = 0,
    this.correctAnswers = 0,
    this.xpGained = 0,
  });

  LearningSessionState copyWith({
    WordModel? currentWord,
    int? totalQuestions,
    int? correctAnswers,
    int? xpGained,
  }) {
    return LearningSessionState(
      currentWord: currentWord ?? this.currentWord,
      totalQuestions: totalQuestions ?? this.totalQuestions,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      xpGained: xpGained ?? this.xpGained,
    );
  }

  double get accuracy => totalQuestions == 0 ? 0.0 : correctAnswers / totalQuestions;
}

class LearningSessionNotifier extends Notifier<LearningSessionState> {
  @override
  LearningSessionState build() => const LearningSessionState();

  void startSession(WordModel word) {
    state = LearningSessionState(currentWord: word);
  }

  void recordAnswer(bool isCorrect) {
    state = state.copyWith(
      totalQuestions: state.totalQuestions + 1,
      correctAnswers: state.correctAnswers + (isCorrect ? 1 : 0),
      xpGained: state.xpGained + (isCorrect ? 15 : 5),
    );
  }

  void resetSession() {
    state = const LearningSessionState();
  }
}

final learningSessionProvider = NotifierProvider<LearningSessionNotifier, LearningSessionState>(() {
  return LearningSessionNotifier();
});
