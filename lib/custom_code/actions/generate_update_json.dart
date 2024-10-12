// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

Future<dynamic> generateUpdateJson(List<JsonStruct> jsonFields) async {
  Map<String, dynamic> jsonMap = {};

  for (JsonStruct field in jsonFields) {
    String key = field.key;
    dynamic value = field.stringValue;

    // Attempt to cast the value to different types in a specific order
    if (value != null) {
      // Try parsing as int
      if (int.tryParse(value) != null) {
        jsonMap[key] = int.parse(value);
      }
      // Try parsing as double
      else if (double.tryParse(value) != null) {
        jsonMap[key] = double.parse(value);
      }
      // Try parsing as boolean (case-insensitive)
      else if (value.toLowerCase() == 'true' ||
          value.toLowerCase() == 'false') {
        jsonMap[key] = value.toLowerCase() == 'true';
      }
      // Default to string if no other types match
      else {
        jsonMap[key] = value;
      }
    } else {
      // Handle null values (optional)
      jsonMap[key] = value;
    }
  }
  return jsonMap;
  // Convert map to formatted JSON string
  /* String formattedJsonString = JsonEncoder.withIndent('  ').convert(jsonMap);
  print('Final JSON Payload: $formattedJsonString');

  return formattedJsonString;*/
}
