import '/flutter_flow/flutter_flow_util.dart';
import 'record_field_widget.dart' show RecordFieldWidget;
import 'package:flutter/material.dart';

class RecordFieldModel extends FlutterFlowModel<RecordFieldWidget> {
  ///  Local state fields for this component.

  String? fieldJson;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
