// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JsonStruct extends BaseStruct {
  JsonStruct({
    String? key,
    String? stringValue,
    int? intValue,
    double? doubleValue,
    bool? boolValue,
  })  : _key = key,
        _stringValue = stringValue,
        _intValue = intValue,
        _doubleValue = doubleValue,
        _boolValue = boolValue;

  // "key" field.
  String? _key;
  String get key => _key ?? '';
  set key(String? val) => _key = val;

  bool hasKey() => _key != null;

  // "stringValue" field.
  String? _stringValue;
  String get stringValue => _stringValue ?? '';
  set stringValue(String? val) => _stringValue = val;

  bool hasStringValue() => _stringValue != null;

  // "intValue" field.
  int? _intValue;
  int get intValue => _intValue ?? 0;
  set intValue(int? val) => _intValue = val;

  void incrementIntValue(int amount) => intValue = intValue + amount;

  bool hasIntValue() => _intValue != null;

  // "doubleValue" field.
  double? _doubleValue;
  double get doubleValue => _doubleValue ?? 0.0;
  set doubleValue(double? val) => _doubleValue = val;

  void incrementDoubleValue(double amount) =>
      doubleValue = doubleValue + amount;

  bool hasDoubleValue() => _doubleValue != null;

  // "boolValue" field.
  bool? _boolValue;
  bool get boolValue => _boolValue ?? false;
  set boolValue(bool? val) => _boolValue = val;

  bool hasBoolValue() => _boolValue != null;

  static JsonStruct fromMap(Map<String, dynamic> data) => JsonStruct(
        key: data['key'] as String?,
        stringValue: data['stringValue'] as String?,
        intValue: castToType<int>(data['intValue']),
        doubleValue: castToType<double>(data['doubleValue']),
        boolValue: data['boolValue'] as bool?,
      );

  static JsonStruct? maybeFromMap(dynamic data) =>
      data is Map ? JsonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'key': _key,
        'stringValue': _stringValue,
        'intValue': _intValue,
        'doubleValue': _doubleValue,
        'boolValue': _boolValue,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'key': serializeParam(
          _key,
          ParamType.String,
        ),
        'stringValue': serializeParam(
          _stringValue,
          ParamType.String,
        ),
        'intValue': serializeParam(
          _intValue,
          ParamType.int,
        ),
        'doubleValue': serializeParam(
          _doubleValue,
          ParamType.double,
        ),
        'boolValue': serializeParam(
          _boolValue,
          ParamType.bool,
        ),
      }.withoutNulls;

  static JsonStruct fromSerializableMap(Map<String, dynamic> data) =>
      JsonStruct(
        key: deserializeParam(
          data['key'],
          ParamType.String,
          false,
        ),
        stringValue: deserializeParam(
          data['stringValue'],
          ParamType.String,
          false,
        ),
        intValue: deserializeParam(
          data['intValue'],
          ParamType.int,
          false,
        ),
        doubleValue: deserializeParam(
          data['doubleValue'],
          ParamType.double,
          false,
        ),
        boolValue: deserializeParam(
          data['boolValue'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'JsonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is JsonStruct &&
        key == other.key &&
        stringValue == other.stringValue &&
        intValue == other.intValue &&
        doubleValue == other.doubleValue &&
        boolValue == other.boolValue;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([key, stringValue, intValue, doubleValue, boolValue]);
}

JsonStruct createJsonStruct({
  String? key,
  String? stringValue,
  int? intValue,
  double? doubleValue,
  bool? boolValue,
}) =>
    JsonStruct(
      key: key,
      stringValue: stringValue,
      intValue: intValue,
      doubleValue: doubleValue,
      boolValue: boolValue,
    );
