import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/record_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'record_model.dart';
export 'record_model.dart';

class RecordWidget extends StatefulWidget {
  const RecordWidget({
    super.key,
    required this.datasheet,
    required this.recordJson,
  });

  final DatasheetStruct? datasheet;
  final dynamic recordJson;

  @override
  State<RecordWidget> createState() => _RecordWidgetState();
}

class _RecordWidgetState extends State<RecordWidget> {
  late RecordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecordModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.datasheet?.titleColumn,
              'Title',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
              child: FlutterFlowIconButton(
                borderRadius: 20.0,
                borderWidth: 1.0,
                buttonSize: 40.0,
                icon: FaIcon(
                  FontAwesomeIcons.cloudUploadAlt,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 24.0,
                ),
                onPressed: () async {
                  var shouldSetState = false;
                  var confirmDialogResponse = await showDialog<bool>(
                        context: context,
                        builder: (alertDialogContext) {
                          return AlertDialog(
                            title: const Text('Save'),
                            content: const Text(
                                'Would you like to save your changes to AiTable?'),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(alertDialogContext, true),
                                child: const Text('Confirm'),
                              ),
                            ],
                          );
                        },
                      ) ??
                      false;
                  if (confirmDialogResponse) {
                    _model.jsonUpdaterConvert =
                        await actions.generateUpdateJson(
                      FFAppState().jsonUpdater.toList(),
                    );
                    shouldSetState = true;
                    _model.apiResultiju =
                        await AiTableGroup.updateRecordCall.call(
                      key: FFAppState().apiKey,
                      fieldsJson: _model.jsonUpdaterConvert,
                      recordId: getJsonField(
                        widget.recordJson,
                        r'''$.recordId''',
                      ).toString(),
                      tableID: widget.datasheet?.id,
                    );

                    shouldSetState = true;
                    if ((_model.apiResultiju?.succeeded ?? true)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Update Successful',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).success,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Update Failed',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: FlutterFlowTheme.of(context).error,
                        ),
                      );
                    }

                    FFAppState().jsonUpdater = [];
                  } else {
                    if (shouldSetState) safeSetState(() {});
                    return;
                  }

                  if (shouldSetState) safeSetState(() {});
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final fields = widget.datasheet?.fields.toList() ?? [];

                      return ListView.separated(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: fields.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                        itemBuilder: (context, fieldsIndex) {
                          final fieldsItem = fields[fieldsIndex];
                          return wrapWithModel(
                            model: _model.recordFieldModels.getModel(
                              valueOrDefault<String>(
                                fieldsItem,
                                'Field Name',
                              ),
                              fieldsIndex,
                            ),
                            updateCallback: () => safeSetState(() {}),
                            updateOnChange: true,
                            child: RecordFieldWidget(
                              key: Key(
                                'Key6oh_${valueOrDefault<String>(
                                  fieldsItem,
                                  'Field Name',
                                )}',
                              ),
                              fieldName: valueOrDefault<String>(
                                fieldsItem,
                                'Field Name',
                              ),
                              fieldData: functions.extractValueFromField(
                                  widget.recordJson!, fieldsItem)!,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
