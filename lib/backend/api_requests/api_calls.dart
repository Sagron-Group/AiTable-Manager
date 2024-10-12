import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start AiTable Group Code

class AiTableGroup {
  static String getBaseUrl({
    String? key = '',
  }) =>
      'https://aitable.ai/fusion/v1';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [key]',
  };
  static DatasheetCall datasheetCall = DatasheetCall();
  static UpdateRecordCall updateRecordCall = UpdateRecordCall();
  static AddRecordCall addRecordCall = AddRecordCall();
}

class DatasheetCall {
  Future<ApiCallResponse> call({
    String? id = '',
    String? key = '',
  }) async {
    final baseUrl = AiTableGroup.getBaseUrl(
      key: key,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'Datasheet',
      apiUrl: '$baseUrl/datasheets/$id/records',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $key',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  List? records(dynamic response) => getJsonField(
        response,
        r'''$.data.records''',
        true,
      ) as List?;
  int? totalRecords(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.total''',
      ));
}

class UpdateRecordCall {
  Future<ApiCallResponse> call({
    String? tableID = '',
    String? recordId = '',
    dynamic fieldsJson,
    String? key = '',
  }) async {
    final baseUrl = AiTableGroup.getBaseUrl(
      key: key,
    );

    final fields = _serializeJson(fieldsJson);
    final ffApiRequestBody = '''
{
  "records": [
    {
      "recordId": "$recordId",
      "fields": $fields
    }
  ],
  "fieldKey": "name"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Update Record',
      apiUrl: '$baseUrl/datasheets/$tableID/records?fieldKey=name',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer $key',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AddRecordCall {
  Future<ApiCallResponse> call({
    String? tableID = '',
    dynamic fieldsJsonJson,
    String? key = '',
  }) async {
    final baseUrl = AiTableGroup.getBaseUrl(
      key: key,
    );

    final fieldsJson = _serializeJson(fieldsJsonJson);
    final ffApiRequestBody = '''
{
  "records": [
    {
      "fields": $fieldsJson
    }
  ],
  "fieldKey": "name"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Add Record',
      apiUrl: '$baseUrl/datasheets/$tableID/records?fieldKey=name',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer $key',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? success(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
}

/// End AiTable Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
