// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'word_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WordModel {

@JsonKey(name: '_id') String? get id; String get word; int get rank; String get level; String get topic; String get definition; String? get notes;@JsonKey(name: 'notes_md') String? get notesMd; List<String> get choices; List<String> get exampleSentences; List<String> get exampleSentencesTranslated; List<String> get sentenceBreakdowns; List<String> get exampleSentencesAudioUrls; List<String> get exampleSentencesAudioUrlsNorthern;// Sử dụng Map<String, dynamic> tạm thời cho bản MVP để parse nhanh các object lồng nhau
 Map<String, dynamic> get flashcard; Map<String, dynamic>? get multiChoiceQuiz; Map<String, dynamic>? get fillBlankQuiz; String? get createdAt; String? get updatedAt;
/// Create a copy of WordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WordModelCopyWith<WordModel> get copyWith => _$WordModelCopyWithImpl<WordModel>(this as WordModel, _$identity);

  /// Serializes this WordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.level, level) || other.level == level)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.notesMd, notesMd) || other.notesMd == notesMd)&&const DeepCollectionEquality().equals(other.choices, choices)&&const DeepCollectionEquality().equals(other.exampleSentences, exampleSentences)&&const DeepCollectionEquality().equals(other.exampleSentencesTranslated, exampleSentencesTranslated)&&const DeepCollectionEquality().equals(other.sentenceBreakdowns, sentenceBreakdowns)&&const DeepCollectionEquality().equals(other.exampleSentencesAudioUrls, exampleSentencesAudioUrls)&&const DeepCollectionEquality().equals(other.exampleSentencesAudioUrlsNorthern, exampleSentencesAudioUrlsNorthern)&&const DeepCollectionEquality().equals(other.flashcard, flashcard)&&const DeepCollectionEquality().equals(other.multiChoiceQuiz, multiChoiceQuiz)&&const DeepCollectionEquality().equals(other.fillBlankQuiz, fillBlankQuiz)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,word,rank,level,topic,definition,notes,notesMd,const DeepCollectionEquality().hash(choices),const DeepCollectionEquality().hash(exampleSentences),const DeepCollectionEquality().hash(exampleSentencesTranslated),const DeepCollectionEquality().hash(sentenceBreakdowns),const DeepCollectionEquality().hash(exampleSentencesAudioUrls),const DeepCollectionEquality().hash(exampleSentencesAudioUrlsNorthern),const DeepCollectionEquality().hash(flashcard),const DeepCollectionEquality().hash(multiChoiceQuiz),const DeepCollectionEquality().hash(fillBlankQuiz),createdAt,updatedAt]);

@override
String toString() {
  return 'WordModel(id: $id, word: $word, rank: $rank, level: $level, topic: $topic, definition: $definition, notes: $notes, notesMd: $notesMd, choices: $choices, exampleSentences: $exampleSentences, exampleSentencesTranslated: $exampleSentencesTranslated, sentenceBreakdowns: $sentenceBreakdowns, exampleSentencesAudioUrls: $exampleSentencesAudioUrls, exampleSentencesAudioUrlsNorthern: $exampleSentencesAudioUrlsNorthern, flashcard: $flashcard, multiChoiceQuiz: $multiChoiceQuiz, fillBlankQuiz: $fillBlankQuiz, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $WordModelCopyWith<$Res>  {
  factory $WordModelCopyWith(WordModel value, $Res Function(WordModel) _then) = _$WordModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '_id') String? id, String word, int rank, String level, String topic, String definition, String? notes,@JsonKey(name: 'notes_md') String? notesMd, List<String> choices, List<String> exampleSentences, List<String> exampleSentencesTranslated, List<String> sentenceBreakdowns, List<String> exampleSentencesAudioUrls, List<String> exampleSentencesAudioUrlsNorthern, Map<String, dynamic> flashcard, Map<String, dynamic>? multiChoiceQuiz, Map<String, dynamic>? fillBlankQuiz, String? createdAt, String? updatedAt
});




}
/// @nodoc
class _$WordModelCopyWithImpl<$Res>
    implements $WordModelCopyWith<$Res> {
  _$WordModelCopyWithImpl(this._self, this._then);

  final WordModel _self;
  final $Res Function(WordModel) _then;

/// Create a copy of WordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? word = null,Object? rank = null,Object? level = null,Object? topic = null,Object? definition = null,Object? notes = freezed,Object? notesMd = freezed,Object? choices = null,Object? exampleSentences = null,Object? exampleSentencesTranslated = null,Object? sentenceBreakdowns = null,Object? exampleSentencesAudioUrls = null,Object? exampleSentencesAudioUrlsNorthern = null,Object? flashcard = null,Object? multiChoiceQuiz = freezed,Object? fillBlankQuiz = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,notesMd: freezed == notesMd ? _self.notesMd : notesMd // ignore: cast_nullable_to_non_nullable
as String?,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,exampleSentences: null == exampleSentences ? _self.exampleSentences : exampleSentences // ignore: cast_nullable_to_non_nullable
as List<String>,exampleSentencesTranslated: null == exampleSentencesTranslated ? _self.exampleSentencesTranslated : exampleSentencesTranslated // ignore: cast_nullable_to_non_nullable
as List<String>,sentenceBreakdowns: null == sentenceBreakdowns ? _self.sentenceBreakdowns : sentenceBreakdowns // ignore: cast_nullable_to_non_nullable
as List<String>,exampleSentencesAudioUrls: null == exampleSentencesAudioUrls ? _self.exampleSentencesAudioUrls : exampleSentencesAudioUrls // ignore: cast_nullable_to_non_nullable
as List<String>,exampleSentencesAudioUrlsNorthern: null == exampleSentencesAudioUrlsNorthern ? _self.exampleSentencesAudioUrlsNorthern : exampleSentencesAudioUrlsNorthern // ignore: cast_nullable_to_non_nullable
as List<String>,flashcard: null == flashcard ? _self.flashcard : flashcard // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,multiChoiceQuiz: freezed == multiChoiceQuiz ? _self.multiChoiceQuiz : multiChoiceQuiz // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,fillBlankQuiz: freezed == fillBlankQuiz ? _self.fillBlankQuiz : fillBlankQuiz // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WordModel].
extension WordModelPatterns on WordModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WordModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WordModel value)  $default,){
final _that = this;
switch (_that) {
case _WordModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WordModel value)?  $default,){
final _that = this;
switch (_that) {
case _WordModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String word,  int rank,  String level,  String topic,  String definition,  String? notes, @JsonKey(name: 'notes_md')  String? notesMd,  List<String> choices,  List<String> exampleSentences,  List<String> exampleSentencesTranslated,  List<String> sentenceBreakdowns,  List<String> exampleSentencesAudioUrls,  List<String> exampleSentencesAudioUrlsNorthern,  Map<String, dynamic> flashcard,  Map<String, dynamic>? multiChoiceQuiz,  Map<String, dynamic>? fillBlankQuiz,  String? createdAt,  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WordModel() when $default != null:
return $default(_that.id,_that.word,_that.rank,_that.level,_that.topic,_that.definition,_that.notes,_that.notesMd,_that.choices,_that.exampleSentences,_that.exampleSentencesTranslated,_that.sentenceBreakdowns,_that.exampleSentencesAudioUrls,_that.exampleSentencesAudioUrlsNorthern,_that.flashcard,_that.multiChoiceQuiz,_that.fillBlankQuiz,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: '_id')  String? id,  String word,  int rank,  String level,  String topic,  String definition,  String? notes, @JsonKey(name: 'notes_md')  String? notesMd,  List<String> choices,  List<String> exampleSentences,  List<String> exampleSentencesTranslated,  List<String> sentenceBreakdowns,  List<String> exampleSentencesAudioUrls,  List<String> exampleSentencesAudioUrlsNorthern,  Map<String, dynamic> flashcard,  Map<String, dynamic>? multiChoiceQuiz,  Map<String, dynamic>? fillBlankQuiz,  String? createdAt,  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _WordModel():
return $default(_that.id,_that.word,_that.rank,_that.level,_that.topic,_that.definition,_that.notes,_that.notesMd,_that.choices,_that.exampleSentences,_that.exampleSentencesTranslated,_that.sentenceBreakdowns,_that.exampleSentencesAudioUrls,_that.exampleSentencesAudioUrlsNorthern,_that.flashcard,_that.multiChoiceQuiz,_that.fillBlankQuiz,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: '_id')  String? id,  String word,  int rank,  String level,  String topic,  String definition,  String? notes, @JsonKey(name: 'notes_md')  String? notesMd,  List<String> choices,  List<String> exampleSentences,  List<String> exampleSentencesTranslated,  List<String> sentenceBreakdowns,  List<String> exampleSentencesAudioUrls,  List<String> exampleSentencesAudioUrlsNorthern,  Map<String, dynamic> flashcard,  Map<String, dynamic>? multiChoiceQuiz,  Map<String, dynamic>? fillBlankQuiz,  String? createdAt,  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _WordModel() when $default != null:
return $default(_that.id,_that.word,_that.rank,_that.level,_that.topic,_that.definition,_that.notes,_that.notesMd,_that.choices,_that.exampleSentences,_that.exampleSentencesTranslated,_that.sentenceBreakdowns,_that.exampleSentencesAudioUrls,_that.exampleSentencesAudioUrlsNorthern,_that.flashcard,_that.multiChoiceQuiz,_that.fillBlankQuiz,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WordModel implements WordModel {
  const _WordModel({@JsonKey(name: '_id') this.id, required this.word, required this.rank, required this.level, required this.topic, required this.definition, this.notes, @JsonKey(name: 'notes_md') this.notesMd, final  List<String> choices = const [], final  List<String> exampleSentences = const [], final  List<String> exampleSentencesTranslated = const [], final  List<String> sentenceBreakdowns = const [], final  List<String> exampleSentencesAudioUrls = const [], final  List<String> exampleSentencesAudioUrlsNorthern = const [], required final  Map<String, dynamic> flashcard, final  Map<String, dynamic>? multiChoiceQuiz, final  Map<String, dynamic>? fillBlankQuiz, this.createdAt, this.updatedAt}): _choices = choices,_exampleSentences = exampleSentences,_exampleSentencesTranslated = exampleSentencesTranslated,_sentenceBreakdowns = sentenceBreakdowns,_exampleSentencesAudioUrls = exampleSentencesAudioUrls,_exampleSentencesAudioUrlsNorthern = exampleSentencesAudioUrlsNorthern,_flashcard = flashcard,_multiChoiceQuiz = multiChoiceQuiz,_fillBlankQuiz = fillBlankQuiz;
  factory _WordModel.fromJson(Map<String, dynamic> json) => _$WordModelFromJson(json);

@override@JsonKey(name: '_id') final  String? id;
@override final  String word;
@override final  int rank;
@override final  String level;
@override final  String topic;
@override final  String definition;
@override final  String? notes;
@override@JsonKey(name: 'notes_md') final  String? notesMd;
 final  List<String> _choices;
@override@JsonKey() List<String> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

 final  List<String> _exampleSentences;
@override@JsonKey() List<String> get exampleSentences {
  if (_exampleSentences is EqualUnmodifiableListView) return _exampleSentences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exampleSentences);
}

 final  List<String> _exampleSentencesTranslated;
@override@JsonKey() List<String> get exampleSentencesTranslated {
  if (_exampleSentencesTranslated is EqualUnmodifiableListView) return _exampleSentencesTranslated;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exampleSentencesTranslated);
}

 final  List<String> _sentenceBreakdowns;
@override@JsonKey() List<String> get sentenceBreakdowns {
  if (_sentenceBreakdowns is EqualUnmodifiableListView) return _sentenceBreakdowns;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sentenceBreakdowns);
}

 final  List<String> _exampleSentencesAudioUrls;
@override@JsonKey() List<String> get exampleSentencesAudioUrls {
  if (_exampleSentencesAudioUrls is EqualUnmodifiableListView) return _exampleSentencesAudioUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exampleSentencesAudioUrls);
}

 final  List<String> _exampleSentencesAudioUrlsNorthern;
@override@JsonKey() List<String> get exampleSentencesAudioUrlsNorthern {
  if (_exampleSentencesAudioUrlsNorthern is EqualUnmodifiableListView) return _exampleSentencesAudioUrlsNorthern;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_exampleSentencesAudioUrlsNorthern);
}

// Sử dụng Map<String, dynamic> tạm thời cho bản MVP để parse nhanh các object lồng nhau
 final  Map<String, dynamic> _flashcard;
// Sử dụng Map<String, dynamic> tạm thời cho bản MVP để parse nhanh các object lồng nhau
@override Map<String, dynamic> get flashcard {
  if (_flashcard is EqualUnmodifiableMapView) return _flashcard;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_flashcard);
}

 final  Map<String, dynamic>? _multiChoiceQuiz;
@override Map<String, dynamic>? get multiChoiceQuiz {
  final value = _multiChoiceQuiz;
  if (value == null) return null;
  if (_multiChoiceQuiz is EqualUnmodifiableMapView) return _multiChoiceQuiz;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _fillBlankQuiz;
@override Map<String, dynamic>? get fillBlankQuiz {
  final value = _fillBlankQuiz;
  if (value == null) return null;
  if (_fillBlankQuiz is EqualUnmodifiableMapView) return _fillBlankQuiz;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override final  String? createdAt;
@override final  String? updatedAt;

/// Create a copy of WordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WordModelCopyWith<_WordModel> get copyWith => __$WordModelCopyWithImpl<_WordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.word, word) || other.word == word)&&(identical(other.rank, rank) || other.rank == rank)&&(identical(other.level, level) || other.level == level)&&(identical(other.topic, topic) || other.topic == topic)&&(identical(other.definition, definition) || other.definition == definition)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.notesMd, notesMd) || other.notesMd == notesMd)&&const DeepCollectionEquality().equals(other._choices, _choices)&&const DeepCollectionEquality().equals(other._exampleSentences, _exampleSentences)&&const DeepCollectionEquality().equals(other._exampleSentencesTranslated, _exampleSentencesTranslated)&&const DeepCollectionEquality().equals(other._sentenceBreakdowns, _sentenceBreakdowns)&&const DeepCollectionEquality().equals(other._exampleSentencesAudioUrls, _exampleSentencesAudioUrls)&&const DeepCollectionEquality().equals(other._exampleSentencesAudioUrlsNorthern, _exampleSentencesAudioUrlsNorthern)&&const DeepCollectionEquality().equals(other._flashcard, _flashcard)&&const DeepCollectionEquality().equals(other._multiChoiceQuiz, _multiChoiceQuiz)&&const DeepCollectionEquality().equals(other._fillBlankQuiz, _fillBlankQuiz)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,word,rank,level,topic,definition,notes,notesMd,const DeepCollectionEquality().hash(_choices),const DeepCollectionEquality().hash(_exampleSentences),const DeepCollectionEquality().hash(_exampleSentencesTranslated),const DeepCollectionEquality().hash(_sentenceBreakdowns),const DeepCollectionEquality().hash(_exampleSentencesAudioUrls),const DeepCollectionEquality().hash(_exampleSentencesAudioUrlsNorthern),const DeepCollectionEquality().hash(_flashcard),const DeepCollectionEquality().hash(_multiChoiceQuiz),const DeepCollectionEquality().hash(_fillBlankQuiz),createdAt,updatedAt]);

@override
String toString() {
  return 'WordModel(id: $id, word: $word, rank: $rank, level: $level, topic: $topic, definition: $definition, notes: $notes, notesMd: $notesMd, choices: $choices, exampleSentences: $exampleSentences, exampleSentencesTranslated: $exampleSentencesTranslated, sentenceBreakdowns: $sentenceBreakdowns, exampleSentencesAudioUrls: $exampleSentencesAudioUrls, exampleSentencesAudioUrlsNorthern: $exampleSentencesAudioUrlsNorthern, flashcard: $flashcard, multiChoiceQuiz: $multiChoiceQuiz, fillBlankQuiz: $fillBlankQuiz, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$WordModelCopyWith<$Res> implements $WordModelCopyWith<$Res> {
  factory _$WordModelCopyWith(_WordModel value, $Res Function(_WordModel) _then) = __$WordModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '_id') String? id, String word, int rank, String level, String topic, String definition, String? notes,@JsonKey(name: 'notes_md') String? notesMd, List<String> choices, List<String> exampleSentences, List<String> exampleSentencesTranslated, List<String> sentenceBreakdowns, List<String> exampleSentencesAudioUrls, List<String> exampleSentencesAudioUrlsNorthern, Map<String, dynamic> flashcard, Map<String, dynamic>? multiChoiceQuiz, Map<String, dynamic>? fillBlankQuiz, String? createdAt, String? updatedAt
});




}
/// @nodoc
class __$WordModelCopyWithImpl<$Res>
    implements _$WordModelCopyWith<$Res> {
  __$WordModelCopyWithImpl(this._self, this._then);

  final _WordModel _self;
  final $Res Function(_WordModel) _then;

/// Create a copy of WordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? word = null,Object? rank = null,Object? level = null,Object? topic = null,Object? definition = null,Object? notes = freezed,Object? notesMd = freezed,Object? choices = null,Object? exampleSentences = null,Object? exampleSentencesTranslated = null,Object? sentenceBreakdowns = null,Object? exampleSentencesAudioUrls = null,Object? exampleSentencesAudioUrlsNorthern = null,Object? flashcard = null,Object? multiChoiceQuiz = freezed,Object? fillBlankQuiz = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_WordModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,word: null == word ? _self.word : word // ignore: cast_nullable_to_non_nullable
as String,rank: null == rank ? _self.rank : rank // ignore: cast_nullable_to_non_nullable
as int,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,topic: null == topic ? _self.topic : topic // ignore: cast_nullable_to_non_nullable
as String,definition: null == definition ? _self.definition : definition // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,notesMd: freezed == notesMd ? _self.notesMd : notesMd // ignore: cast_nullable_to_non_nullable
as String?,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<String>,exampleSentences: null == exampleSentences ? _self._exampleSentences : exampleSentences // ignore: cast_nullable_to_non_nullable
as List<String>,exampleSentencesTranslated: null == exampleSentencesTranslated ? _self._exampleSentencesTranslated : exampleSentencesTranslated // ignore: cast_nullable_to_non_nullable
as List<String>,sentenceBreakdowns: null == sentenceBreakdowns ? _self._sentenceBreakdowns : sentenceBreakdowns // ignore: cast_nullable_to_non_nullable
as List<String>,exampleSentencesAudioUrls: null == exampleSentencesAudioUrls ? _self._exampleSentencesAudioUrls : exampleSentencesAudioUrls // ignore: cast_nullable_to_non_nullable
as List<String>,exampleSentencesAudioUrlsNorthern: null == exampleSentencesAudioUrlsNorthern ? _self._exampleSentencesAudioUrlsNorthern : exampleSentencesAudioUrlsNorthern // ignore: cast_nullable_to_non_nullable
as List<String>,flashcard: null == flashcard ? _self._flashcard : flashcard // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,multiChoiceQuiz: freezed == multiChoiceQuiz ? _self._multiChoiceQuiz : multiChoiceQuiz // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,fillBlankQuiz: freezed == fillBlankQuiz ? _self._fillBlankQuiz : fillBlankQuiz // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
