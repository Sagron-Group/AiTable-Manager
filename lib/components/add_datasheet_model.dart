import '/flutter_flow/flutter_flow_util.dart';
import 'add_datasheet_widget.dart' show AddDatasheetWidget;
import 'package:flutter/material.dart';

class AddDatasheetModel extends FlutterFlowModel<AddDatasheetWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for datasheetName widget.
  FocusNode? datasheetNameFocusNode;
  TextEditingController? datasheetNameTextController;
  String? Function(BuildContext, String?)? datasheetNameTextControllerValidator;
  String? _datasheetNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for datasheetId widget.
  FocusNode? datasheetIdFocusNode;
  TextEditingController? datasheetIdTextController;
  String? Function(BuildContext, String?)? datasheetIdTextControllerValidator;
  String? _datasheetIdTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  String? _titleTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    datasheetNameTextControllerValidator =
        _datasheetNameTextControllerValidator;
    datasheetIdTextControllerValidator = _datasheetIdTextControllerValidator;
    titleTextControllerValidator = _titleTextControllerValidator;
  }

  @override
  void dispose() {
    datasheetNameFocusNode?.dispose();
    datasheetNameTextController?.dispose();

    datasheetIdFocusNode?.dispose();
    datasheetIdTextController?.dispose();

    titleFocusNode?.dispose();
    titleTextController?.dispose();
  }
}
