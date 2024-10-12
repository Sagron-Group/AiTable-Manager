// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DatasheetStruct extends BaseStruct {
  DatasheetStruct({
    String? name,
    String? id,
    String? titleColumn,
    List<String>? fields,
  })  : _name = name,
        _id = id,
        _titleColumn = titleColumn,
        _fields = fields;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "titleColumn" field.
  String? _titleColumn;
  String get titleColumn => _titleColumn ?? '';
  set titleColumn(String? val) => _titleColumn = val;

  bool hasTitleColumn() => _titleColumn != null;

  // "fields" field.
  List<String>? _fields;
  List<String> get fields => _fields ?? const [];
  set fields(List<String>? val) => _fields = val;

  void updateFields(Function(List<String>) updateFn) {
    updateFn(_fields ??= []);
  }

  bool hasFields() => _fields != null;

  static DatasheetStruct fromMap(Map<String, dynamic> data) => DatasheetStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
        titleColumn: data['titleColumn'] as String?,
        fields: getDataList(data['fields']),
      );

  static DatasheetStruct? maybeFromMap(dynamic data) => data is Map
      ? DatasheetStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
        'titleColumn': _titleColumn,
        'fields': _fields,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'titleColumn': serializeParam(
          _titleColumn,
          ParamType.String,
        ),
        'fields': serializeParam(
          _fields,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static DatasheetStruct fromSerializableMap(Map<String, dynamic> data) =>
      DatasheetStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        titleColumn: deserializeParam(
          data['titleColumn'],
          ParamType.String,
          false,
        ),
        fields: deserializeParam<String>(
          data['fields'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'DatasheetStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DatasheetStruct &&
        name == other.name &&
        id == other.id &&
        titleColumn == other.titleColumn &&
        listEquality.equals(fields, other.fields);
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, id, titleColumn, fields]);
}

DatasheetStruct createDatasheetStruct({
  String? name,
  String? id,
  String? titleColumn,
}) =>
    DatasheetStruct(
      name: name,
      id: id,
      titleColumn: titleColumn,
    );
