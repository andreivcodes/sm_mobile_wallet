import 'dart:developer';

import 'package:protospacemesh/protoc/gen/spacemesh/v1/mesh_types.pb.dart';
import 'package:sm_mobile_wallet/components/tx_out_widget.dart';
import 'package:sm_mobile_wallet/components/tx_reward_widget.dart';

import '../components/tx_in_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../receive_tx/receive_tx_widget.dart';
import '../send_tx/send_tx_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:convert/convert.dart';
import 'package:collection/collection.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({
    Key key,
    this.seed,
  }) : super(key: key);

  final String seed;

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget>
    with TickerProviderStateMixin {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'txInOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      fadeIn: true,
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.primaryColor,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.jet,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              color: FlutterFlowTheme.jet,
                              offset: Offset(0, -2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Balance',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 5, 20, 5),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: FutureBuilder<double>(
                                        future: functions
                                            .getBalance(), // async work
                                        builder: (BuildContext context,
                                            AsyncSnapshot<double> snapshot) {
                                          switch (snapshot.connectionState) {
                                            case ConnectionState.waiting:
                                              return Text(
                                                'Loading....',
                                                style: FlutterFlowTheme.title1
                                                    .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: FlutterFlowTheme
                                                      .mediumSpringGreen,
                                                  fontSize: 32,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              );
                                            default:
                                              if (snapshot.hasError) {
                                                log(snapshot.error.toString());
                                                return Text(
                                                  'Error: ${snapshot.error}',
                                                  style: FlutterFlowTheme.title1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .mediumSpringGreen,
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                );
                                              } else if (snapshot.data >
                                                  1000000000000)
                                                return Text(
                                                  '${(snapshot.data / 1000000000000).toStringAsFixed(5)} SMH',
                                                  style: FlutterFlowTheme.title1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .mediumSpringGreen,
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                );
                                              else
                                                return Text(
                                                  '${snapshot.data} SMD',
                                                  style: FlutterFlowTheme.title1
                                                      .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme
                                                        .mediumSpringGreen,
                                                    fontSize: 32,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                );
                                          }
                                        },
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: FlutterFlowTheme.jet,
                                offset: Offset(0, -1),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 15, 20, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Transactions',
                                      style: FlutterFlowTheme.bodyText2,
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 3,
                                indent: 25,
                                endIndent: 25,
                                color: FlutterFlowTheme.primaryColor,
                              ),
                              Expanded(
                                child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 15),
                                    child: FutureBuilder<List<AccountMeshData>>(
                                      future:
                                          functions.getTxList(), // async work
                                      // ignore: missing_return
                                      builder: (BuildContext context,
                                          AsyncSnapshot<List<AccountMeshData>>
                                              snapshot) {
                                        if (snapshot.connectionState ==
                                                ConnectionState.waiting ||
                                            snapshot.hasError) {
                                          return Text(
                                            'Loading....',
                                            style: FlutterFlowTheme.title1
                                                .override(
                                              fontFamily: 'Lexend Deca',
                                              color: FlutterFlowTheme
                                                  .mediumSpringGreen,
                                              fontSize: 32,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          );
                                        } else
                                          return ListView.builder(
                                            padding: EdgeInsets.zero,
                                            scrollDirection: Axis.vertical,
                                            itemCount: snapshot.data.length,
                                            // ignore: missing_return
                                            itemBuilder:
                                                (context, txListIndex) {
                                              List<int> sender = snapshot.data
                                                  .elementAt(txListIndex)
                                                  .meshTransaction
                                                  .transaction
                                                  .sender
                                                  .address
                                                  .toList();
                                              if (sender == null) {
                                                return TxRewardWidget(
                                                  transaction: snapshot.data
                                                      .elementAt(txListIndex)
                                                      .meshTransaction
                                                      .transaction,
                                                ).animated([
                                                  animationsMap[
                                                      'txInOnPageLoadAnimation']
                                                ]);
                                              } else if (ListEquality().equals(
                                                  sender,
                                                  functions.addressIntList)) {
                                                return TxOutWidget(
                                                  transaction: snapshot.data
                                                      .elementAt(txListIndex)
                                                      .meshTransaction
                                                      .transaction,
                                                ).animated([
                                                  animationsMap[
                                                      'txInOnPageLoadAnimation']
                                                ]);
                                              } else {
                                                return TxInWidget(
                                                  transaction: snapshot.data
                                                      .elementAt(txListIndex)
                                                      .meshTransaction
                                                      .transaction,
                                                ).animated([
                                                  animationsMap[
                                                      'txInOnPageLoadAnimation']
                                                ]);
                                              }
                                            },
                                          );
                                      },
                                    )),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 0, 20, 35),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => _loadingButton1 = true);
                                        try {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SendTxWidget(),
                                            ),
                                          );
                                        } finally {
                                          setState(
                                              () => _loadingButton1 = false);
                                        }
                                      },
                                      text: 'Send',
                                      icon: Icon(
                                        Icons.keyboard_arrow_up,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: FlutterFlowTheme.jet,
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 20,
                                      ),
                                      loading: _loadingButton1,
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        setState(() => _loadingButton2 = true);
                                        try {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ReceiveTxWidget(),
                                            ),
                                          );
                                        } finally {
                                          setState(
                                              () => _loadingButton2 = false);
                                        }
                                      },
                                      text: 'Receive',
                                      icon: Icon(
                                        Icons.qr_code_rounded,
                                        size: 15,
                                      ),
                                      options: FFButtonOptions(
                                        width: 130,
                                        height: 40,
                                        color: FlutterFlowTheme.jet,
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 20,
                                      ),
                                      loading: _loadingButton2,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
