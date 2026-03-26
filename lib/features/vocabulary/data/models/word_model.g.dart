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
      definition: json['definition'] as String,
      notes: json['notes'] as String?,
      notesMd: json['notes_md'] as String?,
      choices: (json['choices'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exampleSentences: (json['exampleSentences'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exampleSentencesTranslated:
          (json['exampleSentencesTranslated'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      sentenceBreakdowns: (json['sentenceBreakdowns'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      exampleSentencesAudioUrls:
          (json['exampleSentencesAudioUrls'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      exampleSentencesAudioUrlsNorthern:
          (json['exampleSentencesAudioUrlsNorthern'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      flashcard: json['flashcard'] as Map<String, dynamic>,
      multiChoiceQuiz: json['multiChoiceQuiz'] as Map<String, dynamic>?,
      fillBlankQuiz: json['fillBlankQuiz'] as Map<String, dynamic>?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$$WordModelImplToJson(_$WordModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'word': instance.word,
      'rank': instance.rank,
      'level': instance.level,
      'topic': instance.topic,
      'definition': instance.definition,
      'notes': instance.notes,
      'notes_md': instance.notesMd,
      'choices': instance.choices,
      'exampleSentences': instance.exampleSentences,
      'exampleSentencesTranslated': instance.exampleSentencesTranslated,
      'sentenceBreakdowns': instance.sentenceBreakdowns,
      'exampleSentencesAudioUrls': instance.exampleSentencesAudioUrls,
      'exampleSentencesAudioUrlsNorthern':
          instance.exampleSentencesAudioUrlsNorthern,
      'flashcard': instance.flashcard,
      'multiChoiceQuiz': instance.multiChoiceQuiz,
      'fillBlankQuiz': instance.fillBlankQuiz,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
