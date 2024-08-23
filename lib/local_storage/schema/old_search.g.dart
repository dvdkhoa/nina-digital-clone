// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_search.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOldSearchCollection on Isar {
  IsarCollection<OldSearch> get oldSearchs => this.collection();
}

const OldSearchSchema = CollectionSchema(
  name: r'OldSearch',
  id: -2956231332546710083,
  properties: {
    r'datetime': PropertySchema(
      id: 0,
      name: r'datetime',
      type: IsarType.dateTime,
    ),
    r'keyword': PropertySchema(
      id: 1,
      name: r'keyword',
      type: IsarType.string,
    )
  },
  estimateSize: _oldSearchEstimateSize,
  serialize: _oldSearchSerialize,
  deserialize: _oldSearchDeserialize,
  deserializeProp: _oldSearchDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _oldSearchGetId,
  getLinks: _oldSearchGetLinks,
  attach: _oldSearchAttach,
  version: '3.1.0+1',
);

int _oldSearchEstimateSize(
  OldSearch object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.keyword.length * 3;
  return bytesCount;
}

void _oldSearchSerialize(
  OldSearch object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.datetime);
  writer.writeString(offsets[1], object.keyword);
}

OldSearch _oldSearchDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OldSearch();
  object.datetime = reader.readDateTime(offsets[0]);
  object.id = id;
  object.keyword = reader.readString(offsets[1]);
  return object;
}

P _oldSearchDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _oldSearchGetId(OldSearch object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _oldSearchGetLinks(OldSearch object) {
  return [];
}

void _oldSearchAttach(IsarCollection<dynamic> col, Id id, OldSearch object) {
  object.id = id;
}

extension OldSearchQueryWhereSort
    on QueryBuilder<OldSearch, OldSearch, QWhere> {
  QueryBuilder<OldSearch, OldSearch, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OldSearchQueryWhere
    on QueryBuilder<OldSearch, OldSearch, QWhereClause> {
  QueryBuilder<OldSearch, OldSearch, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<OldSearch, OldSearch, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterWhereClause> idBetween(
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
}

extension OldSearchQueryFilter
    on QueryBuilder<OldSearch, OldSearch, QFilterCondition> {
  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> datetimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datetime',
        value: value,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> datetimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'datetime',
        value: value,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> datetimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'datetime',
        value: value,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> datetimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'datetime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> keywordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> keywordGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> keywordLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> keywordBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'keyword',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> keywordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> keywordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> keywordContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'keyword',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> keywordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'keyword',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition> keywordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'keyword',
        value: '',
      ));
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterFilterCondition>
      keywordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'keyword',
        value: '',
      ));
    });
  }
}

extension OldSearchQueryObject
    on QueryBuilder<OldSearch, OldSearch, QFilterCondition> {}

extension OldSearchQueryLinks
    on QueryBuilder<OldSearch, OldSearch, QFilterCondition> {}

extension OldSearchQuerySortBy on QueryBuilder<OldSearch, OldSearch, QSortBy> {
  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> sortByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> sortByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> sortByKeyword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.asc);
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> sortByKeywordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.desc);
    });
  }
}

extension OldSearchQuerySortThenBy
    on QueryBuilder<OldSearch, OldSearch, QSortThenBy> {
  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> thenByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> thenByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> thenByKeyword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.asc);
    });
  }

  QueryBuilder<OldSearch, OldSearch, QAfterSortBy> thenByKeywordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'keyword', Sort.desc);
    });
  }
}

extension OldSearchQueryWhereDistinct
    on QueryBuilder<OldSearch, OldSearch, QDistinct> {
  QueryBuilder<OldSearch, OldSearch, QDistinct> distinctByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datetime');
    });
  }

  QueryBuilder<OldSearch, OldSearch, QDistinct> distinctByKeyword(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'keyword', caseSensitive: caseSensitive);
    });
  }
}

extension OldSearchQueryProperty
    on QueryBuilder<OldSearch, OldSearch, QQueryProperty> {
  QueryBuilder<OldSearch, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OldSearch, DateTime, QQueryOperations> datetimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datetime');
    });
  }

  QueryBuilder<OldSearch, String, QQueryOperations> keywordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'keyword');
    });
  }
}
