// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WordModel _$WordModelFromJson(Map<String, dynamic> json) {
  return _WordModel.fromJson(json);
}

/// @nodoc
mixin _$WordModel {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String get word => throw _privateConstructorUsedError;
  int get rank => throw _privateConstructorUsedError;
  String get level => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  List<String> get exampleSentences => throw _privateConstructorUsedError;
  List<String> get sentenceBreakdowns =>
      throw _privateConstructorUsedError; // Sử dụng Map<String, dynamic> tạm thời cho bản MVP để parse nhanh các object lồng nhau
  Map<String, dynamic> get flashcard => throw _privateConstructorUsedError;
  Map<String, dynamic>? get multiChoiceQuiz =>
      throw _privateConstructorUsedError;
  Map<String, dynamic>? get fillBlankQuiz => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WordModelCopyWith<WordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WordModelCopyWith<$Res> {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) then) =
      _$WordModelCopyWithImpl<$Res, WordModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String word,
      int rank,
      String level,
      String topic,
      List<String> exampleSentences,
      List<String> sentenceBreakdowns,
      Map<String, dynamic> flashcard,
      Map<String, dynamic>? multiChoiceQuiz,
      Map<String, dynamic>? fillBlankQuiz});
}

/// @nodoc
class _$WordModelCopyWithImpl<$Res, $Val extends WordModel>
    implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? word = null,
    Object? rank = null,
    Object? level = null,
    Object? topic = null,
    Object? exampleSentences = null,
    Object? sentenceBreakdowns = null,
    Object? flashcard = null,
    Object? multiChoiceQuiz = freezed,
    Object? fillBlankQuiz = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      exampleSentences: null == exampleSentences
          ? _value.exampleSentences
          : exampleSentences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentenceBreakdowns: null == sentenceBreakdowns
          ? _value.sentenceBreakdowns
          : sentenceBreakdowns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      flashcard: null == flashcard
          ? _value.flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      multiChoiceQuiz: freezed == multiChoiceQuiz
          ? _value.multiChoiceQuiz
          : multiChoiceQuiz // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      fillBlankQuiz: freezed == fillBlankQuiz
          ? _value.fillBlankQuiz
          : fillBlankQuiz // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WordModelImplCopyWith<$Res>
    implements $WordModelCopyWith<$Res> {
  factory _$$WordModelImplCopyWith(
          _$WordModelImpl value, $Res Function(_$WordModelImpl) then) =
      __$$WordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String word,
      int rank,
      String level,
      String topic,
      List<String> exampleSentences,
      List<String> sentenceBreakdowns,
      Map<String, dynamic> flashcard,
      Map<String, dynamic>? multiChoiceQuiz,
      Map<String, dynamic>? fillBlankQuiz});
}

/// @nodoc
class __$$WordModelImplCopyWithImpl<$Res>
    extends _$WordModelCopyWithImpl<$Res, _$WordModelImpl>
    implements _$$WordModelImplCopyWith<$Res> {
  __$$WordModelImplCopyWithImpl(
      _$WordModelImpl _value, $Res Function(_$WordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? word = null,
    Object? rank = null,
    Object? level = null,
    Object? topic = null,
    Object? exampleSentences = null,
    Object? sentenceBreakdowns = null,
    Object? flashcard = null,
    Object? multiChoiceQuiz = freezed,
    Object? fillBlankQuiz = freezed,
  }) {
    return _then(_$WordModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      exampleSentences: null == exampleSentences
          ? _value._exampleSentences
          : exampleSentences // ignore: cast_nullable_to_non_nullable
              as List<String>,
      sentenceBreakdowns: null == sentenceBreakdowns
          ? _value._sentenceBreakdowns
          : sentenceBreakdowns // ignore: cast_nullable_to_non_nullable
              as List<String>,
      flashcard: null == flashcard
          ? _value._flashcard
          : flashcard // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      multiChoiceQuiz: freezed == multiChoiceQuiz
          ? _value._multiChoiceQuiz
          : multiChoiceQuiz // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      fillBlankQuiz: freezed == fillBlankQuiz
          ? _value._fillBlankQuiz
          : fillBlankQuiz // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WordModelImpl implements _WordModel {
  const _$WordModelImpl(
      {@JsonKey(name: '_id') this.id,
      required this.word,
      required this.rank,
      required this.level,
      required this.topic,
      required final List<String> exampleSentences,
      required final List<String> sentenceBreakdowns,
      required final Map<String, dynamic> flashcard,
      required final Map<String, dynamic>? multiChoiceQuiz,
      required final Map<String, dynamic>? fillBlankQuiz})
      : _exampleSentences = exampleSentences,
        _sentenceBreakdowns = sentenceBreakdowns,
        _flashcard = flashcard,
        _multiChoiceQuiz = multiChoiceQuiz,
        _fillBlankQuiz = fillBlankQuiz;

  factory _$WordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WordModelImplFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String word;
  @override
  final int rank;
  @override
  final String level;
  @override
  final String topic;
  final List<String> _exampleSentences;
  @override
  List<String> get exampleSentences {
    if (_exampleSentences is EqualUnmodifiableListView)
      return _exampleSentences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exampleSentences);
  }

  final List<String> _sentenceBreakdowns;
  @override
  List<String> get sentenceBreakdowns {
    if (_sentenceBreakdowns is EqualUnmodifiableListView)
      return _sentenceBreakdowns;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sentenceBreakdowns);
  }

// Sử dụng Map<String, dynamic> tạm thời cho bản MVP để parse nhanh các object lồng nhau
  final Map<String, dynamic> _flashcard;
// Sử dụng Map<String, dynamic> tạm thời cho bản MVP để parse nhanh các object lồng nhau
  @override
  Map<String, dynamic> get flashcard {
    if (_flashcard is EqualUnmodifiableMapView) return _flashcard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_flashcard);
  }

  final Map<String, dynamic>? _multiChoiceQuiz;
  @override
  Map<String, dynamic>? get multiChoiceQuiz {
    final value = _multiChoiceQuiz;
    if (value == null) return null;
    if (_multiChoiceQuiz is EqualUnmodifiableMapView) return _multiChoiceQuiz;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, dynamic>? _fillBlankQuiz;
  @override
  Map<String, dynamic>? get fillBlankQuiz {
    final value = _fillBlankQuiz;
    if (value == null) return null;
    if (_fillBlankQuiz is EqualUnmodifiableMapView) return _fillBlankQuiz;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'WordModel(id: $id, word: $word, rank: $rank, level: $level, topic: $topic, exampleSentences: $exampleSentences, sentenceBreakdowns: $sentenceBreakdowns, flashcard: $flashcard, multiChoiceQuiz: $multiChoiceQuiz, fillBlankQuiz: $fillBlankQuiz)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WordModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.word, word) || other.word == word) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            const DeepCollectionEquality()
                .equals(other._exampleSentences, _exampleSentences) &&
            const DeepCollectionEquality()
                .equals(other._sentenceBreakdowns, _sentenceBreakdowns) &&
            const DeepCollectionEquality()
                .equals(other._flashcard, _flashcard) &&
            const DeepCollectionEquality()
                .equals(other._multiChoiceQuiz, _multiChoiceQuiz) &&
            const DeepCollectionEquality()
                .equals(other._fillBlankQuiz, _fillBlankQuiz));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      word,
      rank,
      level,
      topic,
      const DeepCollectionEquality().hash(_exampleSentences),
      const DeepCollectionEquality().hash(_sentenceBreakdowns),
      const DeepCollectionEquality().hash(_flashcard),
      const DeepCollectionEquality().hash(_multiChoiceQuiz),
      const DeepCollectionEquality().hash(_fillBlankQuiz));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      __$$WordModelImplCopyWithImpl<_$WordModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WordModelImplToJson(
      this,
    );
  }
}

abstract class _WordModel implements WordModel {
  const factory _WordModel(
      {@JsonKey(name: '_id') final String? id,
      required final String word,
      required final int rank,
      required final String level,
      required final String topic,
      required final List<String> exampleSentences,
      required final List<String> sentenceBreakdowns,
      required final Map<String, dynamic> flashcard,
      required final Map<String, dynamic>? multiChoiceQuiz,
      required final Map<String, dynamic>? fillBlankQuiz}) = _$WordModelImpl;

  factory _WordModel.fromJson(Map<String, dynamic> json) =
      _$WordModelImpl.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id;
  @override
  String get word;
  @override
  int get rank;
  @override
  String get level;
  @override
  String get topic;
  @override
  List<String> get exampleSentences;
  @override
  List<String> get sentenceBreakdowns;
  @override // Sử dụng Map<String, dynamic> tạm thời cho bản MVP để parse nhanh các object lồng nhau
  Map<String, dynamic> get flashcard;
  @override
  Map<String, dynamic>? get multiChoiceQuiz;
  @override
  Map<String, dynamic>? get fillBlankQuiz;
  @override
  @JsonKey(ignore: true)
  _$$WordModelImplCopyWith<_$WordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
