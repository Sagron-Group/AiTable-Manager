import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';

String? extractValueFromField(
  dynamic recordJson,
  String key,
) {
  // Check if the recordJson is not null and contains the 'fields' section
  if (recordJson != null && recordJson.containsKey('fields')) {
    // Extract the 'fields' section from the recordJson
    Map<String, dynamic> fields = recordJson['fields'];

    // Check if the 'fields' map contains the specified key
    if (fields.containsKey(key)) {
      // Return the value corresponding to the specified key
      return fields[key]?.toString(); // Convert value to string (if not null)
    }
  }

  // If the key is not found or the recordJson format is invalid, return null
  return "";
}
