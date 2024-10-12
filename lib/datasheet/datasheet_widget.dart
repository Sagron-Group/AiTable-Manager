import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'datasheet_model.dart';
export 'datasheet_model.dart';

class DatasheetWidget extends StatefulWidget {
  const DatasheetWidget({
    super.key,
    required this.datasheet,
    required this.indexInList,
  });

  final DatasheetStruct? datasheet;
  final int? indexInList;

  @override
  State<DatasheetWidget> createState() => _DatasheetWidgetState();
}

class _DatasheetWidgetState extends State<DatasheetWidget> {
  late DatasheetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DatasheetModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: AiTableGroup.datasheetCall.call(
        id: widget.datasheet?.id,
        key: FFAppState().apiKey,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final datasheetDatasheetResponse = snapshot.data!;

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
                  widget.datasheet?.name,
                  'Datasheet Name',
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Colors.white,
                      fontSize: 22.0,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
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
                          final records = AiTableGroup.datasheetCall
                                  .records(
                                    datasheetDatasheetResponse.jsonBody,
                                  )
                                  ?.toList() ??
                              [];

                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: records.length,
                            separatorBuilder: (_, __) => const SizedBox(height: 10.0),
                            itemBuilder: (context, recordsIndex) {
                              final recordsItem = records[recordsIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.fieldsList =
                                      await actions.extractFieldTitles(
                                    datasheetDatasheetResponse.jsonBody,
                                  );
                                  FFAppState().updateDatasheetsAtIndex(
                                    widget.indexInList!,
                                    (e) =>
                                        e..fields = _model.fieldsList!.toList(),
                                  );
                                  safeSetState(() {});

                                  context.pushNamed(
                                    'Record',
                                    queryParameters: {
                                      'datasheet': serializeParam(
                                        FFAppState()
                                            .datasheets[widget.indexInList!],
                                        ParamType.DataStruct,
                                      ),
                                      'recordJson': serializeParam(
                                        recordsItem,
                                        ParamType.JSON,
                                      ),
                                    }.withoutNulls,
                                  );

                                  safeSetState(() {});
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4.0,
                                        color: Color(0x33000000),
                                        offset: Offset(
                                          0.0,
                                          2.0,
                                        ),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        functions.extractValueFromField(
                                            recordsItem,
                                            widget.datasheet!.titleColumn),
                                        'Title',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
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
      },
    );
  }
}
