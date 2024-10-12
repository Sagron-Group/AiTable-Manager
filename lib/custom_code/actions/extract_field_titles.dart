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

Future<List<String>> extractFieldTitles(dynamic jsonResponse) async {
  List<String> fieldTitles = [];

  try {
    // Extract 'records' from 'data'
    List<dynamic> records = jsonResponse['data']['records'];

    /*// Iterate through each record to extract field titles
    records.forEach((record) {*/

    dynamic record = records[0];
    // Get the 'fields' section of the record
    Map<String, dynamic> fields = record['fields'];

    // Extract all keys (field titles) from the 'fields' map
    List<String> keys = fields.keys.toList();

    // Add extracted keys (field titles) to the fieldTitles list
    fieldTitles.addAll(keys);
    //  });

    return fieldTitles;
  } catch (e) {
    // Handle any parsing errors gracefully
    print("Error extracting field titles: $e");
    return []; // Return an empty list in case of error
  }
}
