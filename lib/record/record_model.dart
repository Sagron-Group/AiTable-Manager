import '/backend/api_requests/api_calls.dart';
import '/components/record_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'record_widget.dart' show RecordWidget;
import 'package:flutter/material.dart';

class RecordModel extends FlutterFlowModel<RecordWidget> {
  ///  Local state fields for this page.

  dynamic jsonForUpdate;

  ///  State fields for stateful widgets in this page.

  // Models for Record_Field dynamic component.
  late FlutterFlowDynamicModels<RecordFieldModel> recordFieldModels;
  // Stores action output result for [Custom Action - generateUpdateJson] action in IconButton widget.
  dynamic jsonUpdaterConvert;
  // Stores action output result for [Backend Call - API (Update Record)] action in IconButton widget.
  ApiCallResponse? apiResultiju;

  @override
  void initState(BuildContext context) {
    recordFieldModels = FlutterFlowDynamicModels(() => RecordFieldModel());
  }

  @override
  void dispose() {
    recordFieldModels.dispose();
  }
}
