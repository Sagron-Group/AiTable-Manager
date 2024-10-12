import '/flutter_flow/flutter_flow_util.dart';
import 'landing_page_widget.dart' show LandingPageWidget;
import 'package:flutter/material.dart';

class LandingPageModel extends FlutterFlowModel<LandingPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for APIKey widget.
  FocusNode? aPIKeyFocusNode;
  TextEditingController? aPIKeyTextController;
  String? Function(BuildContext, String?)? aPIKeyTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    aPIKeyFocusNode?.dispose();
    aPIKeyTextController?.dispose();
  }
}
