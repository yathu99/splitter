// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetGroupsCollection on Isar {
  IsarCollection<Groups> get groups => this.collection();
}

const GroupsSchema = CollectionSchema(
  name: r'Groups',
  id: -4387421405688881693,
  properties: {
    r'expenses': PropertySchema(
      id: 0,
      name: r'expenses',
      type: IsarType.objectList,
      target: r'Expenses',
    ),
    r'groupId': PropertySchema(
      id: 1,
      name: r'groupId',
      type: IsarType.string,
    ),
    r'groupName': PropertySchema(
      id: 2,
      name: r'groupName',
      type: IsarType.string,
    ),
    r'members': PropertySchema(
      id: 3,
      name: r'members',
      type: IsarType.stringList,
    )
  },
  estimateSize: _groupsEstimateSize,
  serialize: _groupsSerialize,
  deserialize: _groupsDeserialize,
  deserializeProp: _groupsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'Expenses': ExpensesSchema,
    r'ExpenseDistribtion': ExpenseDistribtionSchema
  },
  getId: _groupsGetId,
  getLinks: _groupsGetLinks,
  attach: _groupsAttach,
  version: '3.0.5',
);

int _groupsEstimateSize(
  Groups object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.expenses;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[Expenses]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += ExpensesSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.groupId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.groupName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.members;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _groupsSerialize(
  Groups object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Expenses>(
    offsets[0],
    allOffsets,
    ExpensesSchema.serialize,
    object.expenses,
  );
  writer.writeString(offsets[1], object.groupId);
  writer.writeString(offsets[2], object.groupName);
  writer.writeStringList(offsets[3], object.members);
}

Groups _groupsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Groups();
  object.expenses = reader.readObjectList<Expenses>(
    offsets[0],
    ExpensesSchema.deserialize,
    allOffsets,
    Expenses(),
  );
  object.groupId = reader.readStringOrNull(offsets[1]);
  object.groupName = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.members = reader.readStringList(offsets[3]);
  return object;
}

P _groupsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Expenses>(
        offset,
        ExpensesSchema.deserialize,
        allOffsets,
        Expenses(),
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _groupsGetId(Groups object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _groupsGetLinks(Groups object) {
  return [];
}

void _groupsAttach(IsarCollection<dynamic> col, Id id, Groups object) {
  object.id = id;
}

extension GroupsQueryWhereSort on QueryBuilder<Groups, Groups, QWhere> {
  QueryBuilder<Groups, Groups, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GroupsQueryWhere on QueryBuilder<Groups, Groups, QWhereClause> {
  QueryBuilder<Groups, Groups, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Groups, Groups, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterWhereClause> idBetween(
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

extension GroupsQueryFilter on QueryBuilder<Groups, Groups, QFilterCondition> {
  QueryBuilder<Groups, Groups, QAfterFilterCondition> expensesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenses',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> expensesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenses',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> expensesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenses',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> expensesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenses',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> expensesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenses',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> expensesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenses',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> expensesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenses',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> expensesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenses',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupId',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupId',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupId',
        value: '',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'groupName',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'groupName',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'groupName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'groupName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'groupName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'groupName',
        value: '',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> groupNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'groupName',
        value: '',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'members',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'members',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'members',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'members',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'members',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'members',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'members',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'members',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'members',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'members',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'members',
        value: '',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition>
      membersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'members',
        value: '',
      ));
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Groups, Groups, QAfterFilterCondition> membersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'members',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension GroupsQueryObject on QueryBuilder<Groups, Groups, QFilterCondition> {
  QueryBuilder<Groups, Groups, QAfterFilterCondition> expensesElement(
      FilterQuery<Expenses> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'expenses');
    });
  }
}

extension GroupsQueryLinks on QueryBuilder<Groups, Groups, QFilterCondition> {}

extension GroupsQuerySortBy on QueryBuilder<Groups, Groups, QSortBy> {
  QueryBuilder<Groups, Groups, QAfterSortBy> sortByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> sortByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> sortByGroupName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupName', Sort.asc);
    });
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> sortByGroupNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupName', Sort.desc);
    });
  }
}

extension GroupsQuerySortThenBy on QueryBuilder<Groups, Groups, QSortThenBy> {
  QueryBuilder<Groups, Groups, QAfterSortBy> thenByGroupId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.asc);
    });
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> thenByGroupIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupId', Sort.desc);
    });
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> thenByGroupName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupName', Sort.asc);
    });
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> thenByGroupNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'groupName', Sort.desc);
    });
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Groups, Groups, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension GroupsQueryWhereDistinct on QueryBuilder<Groups, Groups, QDistinct> {
  QueryBuilder<Groups, Groups, QDistinct> distinctByGroupId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Groups, Groups, QDistinct> distinctByGroupName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'groupName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Groups, Groups, QDistinct> distinctByMembers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'members');
    });
  }
}

extension GroupsQueryProperty on QueryBuilder<Groups, Groups, QQueryProperty> {
  QueryBuilder<Groups, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Groups, List<Expenses>?, QQueryOperations> expensesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expenses');
    });
  }

  QueryBuilder<Groups, String?, QQueryOperations> groupIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupId');
    });
  }

  QueryBuilder<Groups, String?, QQueryOperations> groupNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'groupName');
    });
  }

  QueryBuilder<Groups, List<String>?, QQueryOperations> membersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'members');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTempSavedContactCollection on Isar {
  IsarCollection<TempSavedContact> get tempSavedContacts => this.collection();
}

const TempSavedContactSchema = CollectionSchema(
  name: r'TempSavedContact',
  id: 5764644540073362794,
  properties: {
    r'invitedUsers': PropertySchema(
      id: 0,
      name: r'invitedUsers',
      type: IsarType.stringList,
    )
  },
  estimateSize: _tempSavedContactEstimateSize,
  serialize: _tempSavedContactSerialize,
  deserialize: _tempSavedContactDeserialize,
  deserializeProp: _tempSavedContactDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _tempSavedContactGetId,
  getLinks: _tempSavedContactGetLinks,
  attach: _tempSavedContactAttach,
  version: '3.0.5',
);

int _tempSavedContactEstimateSize(
  TempSavedContact object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.invitedUsers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _tempSavedContactSerialize(
  TempSavedContact object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.invitedUsers);
}

TempSavedContact _tempSavedContactDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TempSavedContact();
  object.id = id;
  object.invitedUsers = reader.readStringList(offsets[0]);
  return object;
}

P _tempSavedContactDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _tempSavedContactGetId(TempSavedContact object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _tempSavedContactGetLinks(TempSavedContact object) {
  return [];
}

void _tempSavedContactAttach(
    IsarCollection<dynamic> col, Id id, TempSavedContact object) {
  object.id = id;
}

extension TempSavedContactQueryWhereSort
    on QueryBuilder<TempSavedContact, TempSavedContact, QWhere> {
  QueryBuilder<TempSavedContact, TempSavedContact, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TempSavedContactQueryWhere
    on QueryBuilder<TempSavedContact, TempSavedContact, QWhereClause> {
  QueryBuilder<TempSavedContact, TempSavedContact, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterWhereClause> idBetween(
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

extension TempSavedContactQueryFilter
    on QueryBuilder<TempSavedContact, TempSavedContact, QFilterCondition> {
  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'invitedUsers',
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'invitedUsers',
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invitedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invitedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invitedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invitedUsers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invitedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invitedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invitedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invitedUsers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invitedUsers',
        value: '',
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invitedUsers',
        value: '',
      ));
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'invitedUsers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'invitedUsers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'invitedUsers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'invitedUsers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'invitedUsers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterFilterCondition>
      invitedUsersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'invitedUsers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TempSavedContactQueryObject
    on QueryBuilder<TempSavedContact, TempSavedContact, QFilterCondition> {}

extension TempSavedContactQueryLinks
    on QueryBuilder<TempSavedContact, TempSavedContact, QFilterCondition> {}

extension TempSavedContactQuerySortBy
    on QueryBuilder<TempSavedContact, TempSavedContact, QSortBy> {}

extension TempSavedContactQuerySortThenBy
    on QueryBuilder<TempSavedContact, TempSavedContact, QSortThenBy> {
  QueryBuilder<TempSavedContact, TempSavedContact, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TempSavedContact, TempSavedContact, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension TempSavedContactQueryWhereDistinct
    on QueryBuilder<TempSavedContact, TempSavedContact, QDistinct> {
  QueryBuilder<TempSavedContact, TempSavedContact, QDistinct>
      distinctByInvitedUsers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invitedUsers');
    });
  }
}

extension TempSavedContactQueryProperty
    on QueryBuilder<TempSavedContact, TempSavedContact, QQueryProperty> {
  QueryBuilder<TempSavedContact, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TempSavedContact, List<String>?, QQueryOperations>
      invitedUsersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invitedUsers');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSavedContactsCollection on Isar {
  IsarCollection<SavedContacts> get savedContacts => this.collection();
}

const SavedContactsSchema = CollectionSchema(
  name: r'SavedContacts',
  id: -2489434829170672555,
  properties: {
    r'savedUsers': PropertySchema(
      id: 0,
      name: r'savedUsers',
      type: IsarType.stringList,
    )
  },
  estimateSize: _savedContactsEstimateSize,
  serialize: _savedContactsSerialize,
  deserialize: _savedContactsDeserialize,
  deserializeProp: _savedContactsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _savedContactsGetId,
  getLinks: _savedContactsGetLinks,
  attach: _savedContactsAttach,
  version: '3.0.5',
);

int _savedContactsEstimateSize(
  SavedContacts object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.savedUsers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _savedContactsSerialize(
  SavedContacts object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.savedUsers);
}

SavedContacts _savedContactsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedContacts();
  object.id = id;
  object.savedUsers = reader.readStringList(offsets[0]);
  return object;
}

P _savedContactsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedContactsGetId(SavedContacts object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedContactsGetLinks(SavedContacts object) {
  return [];
}

void _savedContactsAttach(
    IsarCollection<dynamic> col, Id id, SavedContacts object) {
  object.id = id;
}

extension SavedContactsQueryWhereSort
    on QueryBuilder<SavedContacts, SavedContacts, QWhere> {
  QueryBuilder<SavedContacts, SavedContacts, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SavedContactsQueryWhere
    on QueryBuilder<SavedContacts, SavedContacts, QWhereClause> {
  QueryBuilder<SavedContacts, SavedContacts, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SavedContacts, SavedContacts, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterWhereClause> idBetween(
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

extension SavedContactsQueryFilter
    on QueryBuilder<SavedContacts, SavedContacts, QFilterCondition> {
  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'savedUsers',
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'savedUsers',
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'savedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'savedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'savedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'savedUsers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'savedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'savedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'savedUsers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'savedUsers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'savedUsers',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'savedUsers',
        value: '',
      ));
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedUsers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedUsers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedUsers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedUsers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedUsers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterFilterCondition>
      savedUsersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'savedUsers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension SavedContactsQueryObject
    on QueryBuilder<SavedContacts, SavedContacts, QFilterCondition> {}

extension SavedContactsQueryLinks
    on QueryBuilder<SavedContacts, SavedContacts, QFilterCondition> {}

extension SavedContactsQuerySortBy
    on QueryBuilder<SavedContacts, SavedContacts, QSortBy> {}

extension SavedContactsQuerySortThenBy
    on QueryBuilder<SavedContacts, SavedContacts, QSortThenBy> {
  QueryBuilder<SavedContacts, SavedContacts, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedContacts, SavedContacts, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension SavedContactsQueryWhereDistinct
    on QueryBuilder<SavedContacts, SavedContacts, QDistinct> {
  QueryBuilder<SavedContacts, SavedContacts, QDistinct> distinctBySavedUsers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'savedUsers');
    });
  }
}

extension SavedContactsQueryProperty
    on QueryBuilder<SavedContacts, SavedContacts, QQueryProperty> {
  QueryBuilder<SavedContacts, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedContacts, List<String>?, QQueryOperations>
      savedUsersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'savedUsers');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetUserCollection on Isar {
  IsarCollection<User> get users => this.collection();
}

const UserSchema = CollectionSchema(
  name: r'User',
  id: -7838171048429979076,
  properties: {
    r'balance': PropertySchema(
      id: 0,
      name: r'balance',
      type: IsarType.double,
    ),
    r'phoneNo': PropertySchema(
      id: 1,
      name: r'phoneNo',
      type: IsarType.string,
    ),
    r'userId': PropertySchema(
      id: 2,
      name: r'userId',
      type: IsarType.string,
    )
  },
  estimateSize: _userEstimateSize,
  serialize: _userSerialize,
  deserialize: _userDeserialize,
  deserializeProp: _userDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userGetId,
  getLinks: _userGetLinks,
  attach: _userAttach,
  version: '3.0.5',
);

int _userEstimateSize(
  User object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.phoneNo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.userId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userSerialize(
  User object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.balance);
  writer.writeString(offsets[1], object.phoneNo);
  writer.writeString(offsets[2], object.userId);
}

User _userDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = User();
  object.balance = reader.readDoubleOrNull(offsets[0]);
  object.id = id;
  object.phoneNo = reader.readStringOrNull(offsets[1]);
  object.userId = reader.readStringOrNull(offsets[2]);
  return object;
}

P _userDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userGetId(User object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _userGetLinks(User object) {
  return [];
}

void _userAttach(IsarCollection<dynamic> col, Id id, User object) {
  object.id = id;
}

extension UserQueryWhereSort on QueryBuilder<User, User, QWhere> {
  QueryBuilder<User, User, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserQueryWhere on QueryBuilder<User, User, QWhereClause> {
  QueryBuilder<User, User, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<User, User, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> idBetween(
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

extension UserQueryFilter on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> balanceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'balance',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> balanceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'balance',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> balanceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> balanceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> balanceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balance',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> balanceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<User, User, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<User, User, QAfterFilterCondition> idBetween(
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

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNo',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNo',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNo',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> phoneNoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNo',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userId',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userId',
        value: '',
      ));
    });
  }
}

extension UserQueryObject on QueryBuilder<User, User, QFilterCondition> {}

extension UserQueryLinks on QueryBuilder<User, User, QFilterCondition> {}

extension UserQuerySortBy on QueryBuilder<User, User, QSortBy> {
  QueryBuilder<User, User, QAfterSortBy> sortByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPhoneNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNo', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPhoneNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNo', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserQuerySortThenBy on QueryBuilder<User, User, QSortThenBy> {
  QueryBuilder<User, User, QAfterSortBy> thenByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByBalanceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balance', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPhoneNo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNo', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPhoneNoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNo', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }
}

extension UserQueryWhereDistinct on QueryBuilder<User, User, QDistinct> {
  QueryBuilder<User, User, QDistinct> distinctByBalance() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balance');
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByPhoneNo(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByUserId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userId', caseSensitive: caseSensitive);
    });
  }
}

extension UserQueryProperty on QueryBuilder<User, User, QQueryProperty> {
  QueryBuilder<User, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<User, double?, QQueryOperations> balanceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balance');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> phoneNoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNo');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ExpensesSchema = Schema(
  name: r'Expenses',
  id: -4428151000743579409,
  properties: {
    r'expenseAmount': PropertySchema(
      id: 0,
      name: r'expenseAmount',
      type: IsarType.string,
    ),
    r'expenseDistribution': PropertySchema(
      id: 1,
      name: r'expenseDistribution',
      type: IsarType.object,
      target: r'ExpenseDistribtion',
    ),
    r'expenseId': PropertySchema(
      id: 2,
      name: r'expenseId',
      type: IsarType.string,
    ),
    r'expenseLocation': PropertySchema(
      id: 3,
      name: r'expenseLocation',
      type: IsarType.string,
    ),
    r'expenseMembers': PropertySchema(
      id: 4,
      name: r'expenseMembers',
      type: IsarType.stringList,
    ),
    r'expenseName': PropertySchema(
      id: 5,
      name: r'expenseName',
      type: IsarType.string,
    ),
    r'expenseTimestamp': PropertySchema(
      id: 6,
      name: r'expenseTimestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _expensesEstimateSize,
  serialize: _expensesSerialize,
  deserialize: _expensesDeserialize,
  deserializeProp: _expensesDeserializeProp,
);

int _expensesEstimateSize(
  Expenses object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.expenseAmount;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expenseDistribution;
    if (value != null) {
      bytesCount += 3 +
          ExpenseDistribtionSchema.estimateSize(
              value, allOffsets[ExpenseDistribtion]!, allOffsets);
    }
  }
  {
    final value = object.expenseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expenseLocation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.expenseMembers;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.expenseName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _expensesSerialize(
  Expenses object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.expenseAmount);
  writer.writeObject<ExpenseDistribtion>(
    offsets[1],
    allOffsets,
    ExpenseDistribtionSchema.serialize,
    object.expenseDistribution,
  );
  writer.writeString(offsets[2], object.expenseId);
  writer.writeString(offsets[3], object.expenseLocation);
  writer.writeStringList(offsets[4], object.expenseMembers);
  writer.writeString(offsets[5], object.expenseName);
  writer.writeDateTime(offsets[6], object.expenseTimestamp);
}

Expenses _expensesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Expenses(
    expenseAmount: reader.readStringOrNull(offsets[0]),
    expenseDistribution: reader.readObjectOrNull<ExpenseDistribtion>(
      offsets[1],
      ExpenseDistribtionSchema.deserialize,
      allOffsets,
    ),
    expenseId: reader.readStringOrNull(offsets[2]),
    expenseLocation: reader.readStringOrNull(offsets[3]),
    expenseMembers: reader.readStringList(offsets[4]),
    expenseName: reader.readStringOrNull(offsets[5]),
    expenseTimestamp: reader.readDateTimeOrNull(offsets[6]),
  );
  return object;
}

P _expensesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readObjectOrNull<ExpenseDistribtion>(
        offset,
        ExpenseDistribtionSchema.deserialize,
        allOffsets,
      )) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringList(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ExpensesQueryFilter
    on QueryBuilder<Expenses, Expenses, QFilterCondition> {
  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseAmount',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseAmount',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseAmountEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseAmountGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseAmountLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseAmountBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseAmountContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseAmountMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDistributionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseDistribution',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseDistributionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseDistribution',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseId',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseId',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseId',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseId',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseLocation',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseLocation',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseLocation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseLocation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseLocation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseLocation',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseLocationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseLocation',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseMembers',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseMembers',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseMembers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseMembers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseMembers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseMembers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseMembers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseMembers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseMembers',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseMembers',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseMembers',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseMembers',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenseMembers',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenseMembers',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenseMembers',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenseMembers',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenseMembers',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseMembersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'expenseMembers',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseName',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseName',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseName',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseName',
        value: '',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTimestampIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseTimestamp',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTimestampIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseTimestamp',
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTimestampEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTimestampGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTimestampLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Expenses, Expenses, QAfterFilterCondition>
      expenseTimestampBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ExpensesQueryObject
    on QueryBuilder<Expenses, Expenses, QFilterCondition> {
  QueryBuilder<Expenses, Expenses, QAfterFilterCondition> expenseDistribution(
      FilterQuery<ExpenseDistribtion> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'expenseDistribution');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const ExpenseDistribtionSchema = Schema(
  name: r'ExpenseDistribtion',
  id: 6282925374990758111,
  properties: {
    r'distributionJson': PropertySchema(
      id: 0,
      name: r'distributionJson',
      type: IsarType.string,
    ),
    r'expenseId': PropertySchema(
      id: 1,
      name: r'expenseId',
      type: IsarType.string,
    )
  },
  estimateSize: _expenseDistribtionEstimateSize,
  serialize: _expenseDistribtionSerialize,
  deserialize: _expenseDistribtionDeserialize,
  deserializeProp: _expenseDistribtionDeserializeProp,
);

int _expenseDistribtionEstimateSize(
  ExpenseDistribtion object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.distributionJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.expenseId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _expenseDistribtionSerialize(
  ExpenseDistribtion object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.distributionJson);
  writer.writeString(offsets[1], object.expenseId);
}

ExpenseDistribtion _expenseDistribtionDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ExpenseDistribtion(
    distributionJson: reader.readStringOrNull(offsets[0]),
    expenseId: reader.readStringOrNull(offsets[1]),
  );
  return object;
}

P _expenseDistribtionDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ExpenseDistribtionQueryFilter
    on QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QFilterCondition> {
  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'distributionJson',
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'distributionJson',
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distributionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'distributionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'distributionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'distributionJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'distributionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'distributionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'distributionJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'distributionJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'distributionJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      distributionJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'distributionJson',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'expenseId',
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'expenseId',
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expenseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'expenseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'expenseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expenseId',
        value: '',
      ));
    });
  }

  QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QAfterFilterCondition>
      expenseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'expenseId',
        value: '',
      ));
    });
  }
}

extension ExpenseDistribtionQueryObject
    on QueryBuilder<ExpenseDistribtion, ExpenseDistribtion, QFilterCondition> {}
