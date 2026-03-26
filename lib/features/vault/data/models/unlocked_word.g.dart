// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unlocked_word.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUnlockedWordCollection on Isar {
  IsarCollection<UnlockedWord> get unlockedWords => this.collection();
}

const UnlockedWordSchema = CollectionSchema(
  name: r'UnlockedWord',
  id: 974216421866558455,
  properties: {
    r'currentRank': PropertySchema(
      id: 0,
      name: r'currentRank',
      type: IsarType.long,
    ),
    r'unlockedAt': PropertySchema(
      id: 1,
      name: r'unlockedAt',
      type: IsarType.dateTime,
    ),
    r'wordId': PropertySchema(
      id: 2,
      name: r'wordId',
      type: IsarType.string,
    )
  },
  estimateSize: _unlockedWordEstimateSize,
  serialize: _unlockedWordSerialize,
  deserialize: _unlockedWordDeserialize,
  deserializeProp: _unlockedWordDeserializeProp,
  idName: r'id',
  indexes: {
    r'wordId': IndexSchema(
      id: 2217755591053908536,
      name: r'wordId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'wordId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _unlockedWordGetId,
  getLinks: _unlockedWordGetLinks,
  attach: _unlockedWordAttach,
  version: '3.1.0+1',
);

int _unlockedWordEstimateSize(
  UnlockedWord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.wordId.length * 3;
  return bytesCount;
}

void _unlockedWordSerialize(
  UnlockedWord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentRank);
  writer.writeDateTime(offsets[1], object.unlockedAt);
  writer.writeString(offsets[2], object.wordId);
}

UnlockedWord _unlockedWordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = UnlockedWord();
  object.currentRank = reader.readLong(offsets[0]);
  object.id = id;
  object.unlockedAt = reader.readDateTime(offsets[1]);
  object.wordId = reader.readString(offsets[2]);
  return object;
}

P _unlockedWordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _unlockedWordGetId(UnlockedWord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _unlockedWordGetLinks(UnlockedWord object) {
  return [];
}

void _unlockedWordAttach(
    IsarCollection<dynamic> col, Id id, UnlockedWord object) {
  object.id = id;
}

extension UnlockedWordByIndex on IsarCollection<UnlockedWord> {
  Future<UnlockedWord?> getByWordId(String wordId) {
    return getByIndex(r'wordId', [wordId]);
  }

  UnlockedWord? getByWordIdSync(String wordId) {
    return getByIndexSync(r'wordId', [wordId]);
  }

  Future<bool> deleteByWordId(String wordId) {
    return deleteByIndex(r'wordId', [wordId]);
  }

  bool deleteByWordIdSync(String wordId) {
    return deleteByIndexSync(r'wordId', [wordId]);
  }

  Future<List<UnlockedWord?>> getAllByWordId(List<String> wordIdValues) {
    final values = wordIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'wordId', values);
  }

  List<UnlockedWord?> getAllByWordIdSync(List<String> wordIdValues) {
    final values = wordIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'wordId', values);
  }

  Future<int> deleteAllByWordId(List<String> wordIdValues) {
    final values = wordIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'wordId', values);
  }

  int deleteAllByWordIdSync(List<String> wordIdValues) {
    final values = wordIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'wordId', values);
  }

  Future<Id> putByWordId(UnlockedWord object) {
    return putByIndex(r'wordId', object);
  }

  Id putByWordIdSync(UnlockedWord object, {bool saveLinks = true}) {
    return putByIndexSync(r'wordId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByWordId(List<UnlockedWord> objects) {
    return putAllByIndex(r'wordId', objects);
  }

  List<Id> putAllByWordIdSync(List<UnlockedWord> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'wordId', objects, saveLinks: saveLinks);
  }
}

extension UnlockedWordQueryWhereSort
    on QueryBuilder<UnlockedWord, UnlockedWord, QWhere> {
  QueryBuilder<UnlockedWord, UnlockedWord, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UnlockedWordQueryWhere
    on QueryBuilder<UnlockedWord, UnlockedWord, QWhereClause> {
  QueryBuilder<UnlockedWord, UnlockedWord, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterWhereClause> wordIdEqualTo(
      String wordId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'wordId',
        value: [wordId],
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterWhereClause> wordIdNotEqualTo(
      String wordId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordId',
              lower: [],
              upper: [wordId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordId',
              lower: [wordId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordId',
              lower: [wordId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'wordId',
              lower: [],
              upper: [wordId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension UnlockedWordQueryFilter
    on QueryBuilder<UnlockedWord, UnlockedWord, QFilterCondition> {
  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      currentRankEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentRank',
        value: value,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      currentRankGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentRank',
        value: value,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      currentRankLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentRank',
        value: value,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      currentRankBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentRank',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      unlockedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      unlockedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      unlockedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      unlockedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition> wordIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      wordIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      wordIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition> wordIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wordId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      wordIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      wordIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      wordIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'wordId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition> wordIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'wordId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      wordIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wordId',
        value: '',
      ));
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterFilterCondition>
      wordIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'wordId',
        value: '',
      ));
    });
  }
}

extension UnlockedWordQueryObject
    on QueryBuilder<UnlockedWord, UnlockedWord, QFilterCondition> {}

extension UnlockedWordQueryLinks
    on QueryBuilder<UnlockedWord, UnlockedWord, QFilterCondition> {}

extension UnlockedWordQuerySortBy
    on QueryBuilder<UnlockedWord, UnlockedWord, QSortBy> {
  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> sortByCurrentRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRank', Sort.asc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy>
      sortByCurrentRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRank', Sort.desc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> sortByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy>
      sortByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> sortByWordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordId', Sort.asc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> sortByWordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordId', Sort.desc);
    });
  }
}

extension UnlockedWordQuerySortThenBy
    on QueryBuilder<UnlockedWord, UnlockedWord, QSortThenBy> {
  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> thenByCurrentRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRank', Sort.asc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy>
      thenByCurrentRankDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentRank', Sort.desc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> thenByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy>
      thenByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> thenByWordId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordId', Sort.asc);
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QAfterSortBy> thenByWordIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wordId', Sort.desc);
    });
  }
}

extension UnlockedWordQueryWhereDistinct
    on QueryBuilder<UnlockedWord, UnlockedWord, QDistinct> {
  QueryBuilder<UnlockedWord, UnlockedWord, QDistinct> distinctByCurrentRank() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentRank');
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QDistinct> distinctByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedAt');
    });
  }

  QueryBuilder<UnlockedWord, UnlockedWord, QDistinct> distinctByWordId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wordId', caseSensitive: caseSensitive);
    });
  }
}

extension UnlockedWordQueryProperty
    on QueryBuilder<UnlockedWord, UnlockedWord, QQueryProperty> {
  QueryBuilder<UnlockedWord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<UnlockedWord, int, QQueryOperations> currentRankProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentRank');
    });
  }

  QueryBuilder<UnlockedWord, DateTime, QQueryOperations> unlockedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedAt');
    });
  }

  QueryBuilder<UnlockedWord, String, QQueryOperations> wordIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wordId');
    });
  }
}
