import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../network_selection/network_selection_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class RecoverAccountWidget extends StatefulWidget {
  const RecoverAccountWidget({Key key}) : super(key: key);

  @override
  _RecoverAccountWidgetState createState() => _RecoverAccountWidgetState();
}

class _RecoverAccountWidgetState extends State<RecoverAccountWidget> {
  TextEditingController userInputSeedController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    userInputSeedController = TextEditingController(
        text:
            'faculty car culture flag attract total way diesel hour draft explain mule');
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                child: Text(
                  'Your recovery seed phrase',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).mediumSpringGreen,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                child: Text(
                  'Type in your seed phrase below',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 15),
                child: TextFormField(
                  onChanged: (_) => EasyDebounce.debounce(
                    'userInputSeedController',
                    Duration(milliseconds: 2000),
                    () => setState(() {}),
                  ),
                  controller: userInputSeedController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).jet,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).jet,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: userInputSeedController.text.isNotEmpty
                        ? InkWell(
                            onTap: () => setState(
                              () => userInputSeedController.clear(),
                            ),
                            child: Icon(
                              Icons.clear,
                              color: FlutterFlowTheme.of(context).jet,
                              size: 22,
                            ),
                          )
                        : null,
                  ),
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).mediumSpringGreen,
                        fontWeight: FontWeight.w600,
                      ),
                  maxLines: 5,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 20),
                child: FFButtonWidget(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NetworkSelectionWidget(),
                      ),
                    );
                    setState(() =>
                        FFAppState().userSeed = userInputSeedController.text);
                  },
                  text: 'Recover',
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
