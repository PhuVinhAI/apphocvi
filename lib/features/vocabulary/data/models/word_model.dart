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
    required String definition,
    String? notes,
    @JsonKey(name: 'notes_md') String? notesMd,
    @Default([]) List<String> choices,
    @Default([]) List<String> exampleSentences,
    @Default([]) List<String> exampleSentencesTranslated,
    @Default([]) List<String> sentenceBreakdowns,
    @Default([]) List<String> exampleSentencesAudioUrls,
    @Default([]) List<String> exampleSentencesAudioUrlsNorthern,
    // Sử dụng Map<String, dynamic> tạm thời cho bản MVP để parse nhanh các object lồng nhau
    required Map<String, dynamic> flashcard,
    Map<String, dynamic>? multiChoiceQuiz,
    Map<String, dynamic>? fillBlankQuiz,
    String? createdAt,
    String? updatedAt,
  }) = _WordModel;

  factory WordModel.fromJson(Map<String, dynamic> json) => _$WordModelFromJson(json);
}