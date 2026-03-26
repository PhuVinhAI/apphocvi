import 'package:freezed_annotation/freezed_annotation.dart';

part 'word_model.freezed.dart';
part 'word_model.g.dart';

@freezed
class WordModel with _$WordModel {
  const factory WordModel({
    @JsonKey(name: '_id') String? id,
    required String word,
    required int rank,
    required String level,
    required String topic,
    required List<String> exampleSentences,
    required List<String> sentenceBreakdowns,
    // Sử dụng Map<String, dynamic> tạm thời cho bản MVP để parse nhanh các object lồng nhau
    required Map<String, dynamic> flashcard,
    required Map<String, dynamic>? multiChoiceQuiz,
    required Map<String, dynamic>? fillBlankQuiz,
  }) = _WordModel;

  factory WordModel.fromJson(Map<String, dynamic> json) => _$WordModelFromJson(json);
}