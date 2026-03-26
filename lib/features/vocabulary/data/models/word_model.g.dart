// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WordModelImpl _$$WordModelImplFromJson(Map<String, dynamic> json) =>
    _$WordModelImpl(
      id: json['_id'] as String?,
      word: json['word'] as String,
      rank: (json['rank'] as num).toInt(),
      level: json['level'] as String,
      topic: json['topic'] as String,
      exampleSentences: (json['exampleSentences'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      sentenceBreakdowns: (json['sentenceBreakdowns'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      flashcard: json['flashcard'] as Map<String, dynamic>,
      multiChoiceQuiz: json['multiChoiceQuiz'] as Map<String, dynamic>?,
      fillBlankQuiz: json['fillBlankQuiz'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$WordModelImplToJson(_$WordModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'word': instance.word,
      'rank': instance.rank,
      'level': instance.level,
      'topic': instance.topic,
      'exampleSentences': instance.exampleSentences,
      'sentenceBreakdowns': instance.sentenceBreakdowns,
      'flashcard': instance.flashcard,
      'multiChoiceQuiz': instance.multiChoiceQuiz,
      'fillBlankQuiz': instance.fillBlankQuiz,
    };
