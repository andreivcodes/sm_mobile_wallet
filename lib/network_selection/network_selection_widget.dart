import '../account_created/account_created_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class NetworkSelectionWidget extends StatefulWidget {
  const NetworkSelectionWidget({Key key}) : super(key: key);

  @override
  _NetworkSelectionWidgetState createState() => _NetworkSelectionWidgetState();
}

class _NetworkSelectionWidgetState extends State<NetworkSelectionWidget> {
  String dropDownValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).mediumSpringGreen,
        iconTheme: IconThemeData(color: FlutterFlowTheme.of(context).jet),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: Color(0xFF14181B),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                    child: Text(
                      'Network selection',
                      style: FlutterFlowTheme.of(context).title1.override(
                            fontFamily: 'Poppins',
                            color:
                                FlutterFlowTheme.of(context).mediumSpringGreen,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                    child: Text(
                      'Select the Spacemesh network \ndeployment you want to connect to ',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                          ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                      child: FutureBuilder<List<String>>(
                        future: functions.getAvailableNetworks(), // async work
                        builder: (BuildContext context,
                            AsyncSnapshot<List<String>> snapshot) {
                          if (snapshot.hasData) {
                            return FlutterFlowDropDown(
                              initialOption: dropDownValue ??=
                                  snapshot.data.toList()[0],
                              options: snapshot.data.toList(),
                              onChanged: (val) =>
                                  setState(() => dropDownValue = val),
                              width: 180,
                              height: 40,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                  ),
                              hintText: 'Please select...',
                              fillColor: FlutterFlowTheme.of(context).jet,
                              elevation: 2,
                              borderColor:
                                  FlutterFlowTheme.of(context).primaryColor,
                              borderWidth: 1,
                              borderRadius: 12,
                              margin:
                                  EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                              hidesUnderline: true,
                            );
                          } else {
                            return Text(
                              "Loading...",
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                            );
                          }
                        },
                      )),
                ],
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 20),
                child: FFButtonWidget(
                  onPressed: () async {
                    setState(
                        () => FFAppState().selectedNetwork = dropDownValue);
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountCreatedWidget(),
                      ),
                    );
                  },
                  text: 'Continue',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50,
                    color: FlutterFlowTheme.of(context).mediumSpringGreen,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.of(context).jet,
                        ),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
