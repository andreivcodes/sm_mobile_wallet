import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SendTxWidget extends StatefulWidget {
  SendTxWidget({Key key}) : super(key: key);

  @override
  _SendTxWidgetState createState() => _SendTxWidgetState();
}

class _SendTxWidgetState extends State<SendTxWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
    textController3 = TextEditingController(text: '1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        iconTheme: IconThemeData(color: FlutterFlowTheme.jet),
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.customColor1,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.customColor1,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: Text(
                  'Send smesh',
                  style: FlutterFlowTheme.title2.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.primaryColor,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 25, 15, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Balance: ',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.title3.override(
                          fontFamily: 'Poppins',
                          color: Color(0xFFEEEEEE),
                        ),
                      ),
                      Text(
                        '${functions.getBalance()} SMH',
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.mediumSpringGreen,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 5),
                        child: Text(
                          'Amount: ',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFEEEEEE),
                          ),
                        ),
                      ),
                      TextFormField(
                        onChanged: (_) => setState(() {}),
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: '[Some hint text...]',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.mediumSpringGreen,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.jet,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.jet,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          suffixIcon: textController1.text.isNotEmpty
                              ? InkWell(
                                  onTap: () => setState(
                                    () => textController1.clear(),
                                  ),
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.jet,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.mediumSpringGreen,
                        ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 5),
                        child: Text(
                          'To:',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFEEEEEE),
                          ),
                        ),
                      ),
                      TextFormField(
                        onChanged: (_) => setState(() {}),
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: '[Some hint text...]',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.mediumSpringGreen,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.jet,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.jet,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                          suffixIcon: textController2.text.isNotEmpty
                              ? InkWell(
                                  onTap: () => setState(
                                    () => textController2.clear(),
                                  ),
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.jet,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.mediumSpringGreen,
                        ),
                        textAlign: TextAlign.start,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 5),
                        child: Text(
                          'Fee:',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFFEEEEEE),
                          ),
                        ),
                      ),
                      TextFormField(
                        onChanged: (_) => setState(() {}),
                        controller: textController3,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: '[Some hint text...]',
                          hintStyle: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            color: FlutterFlowTheme.mediumSpringGreen,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.jet,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.jet,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          contentPadding:
                              EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                          suffixIcon: textController3.text.isNotEmpty
                              ? InkWell(
                                  onTap: () => setState(
                                    () => textController3.clear(),
                                  ),
                                  child: Icon(
                                    Icons.clear,
                                    color: FlutterFlowTheme.jet,
                                    size: 22,
                                  ),
                                )
                              : null,
                        ),
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.mediumSpringGreen,
                        ),
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.number,
                      )
                    ],
                  ),
                ),
              ),
              Spacer(),
              FFButtonWidget(
                onPressed: () {
                  print('Button pressed ...');
                },
                text: 'Send',
                icon: Icon(
                  Icons.keyboard_arrow_up_outlined,
                  size: 15,
                ),
                options: FFButtonOptions(
                  width: 130,
                  height: 40,
                  color: FlutterFlowTheme.primaryColor,
                  textStyle: FlutterFlowTheme.subtitle2.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.jet,
                  ),
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                  borderRadius: 20,
                ),
                loading: _loadingButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}
