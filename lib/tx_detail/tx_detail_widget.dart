import 'package:protospacemesh/protoc/gen/spacemesh/v1/types.pb.dart';
import 'package:share/share.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main_screen/main_screen_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:convert/convert.dart';

class TxDetailWidget extends StatefulWidget {
  TxDetailWidget({
    Key key,
    this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  _TxDetailWidgetState createState() => _TxDetailWidgetState();
}

class _TxDetailWidgetState extends State<TxDetailWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 3),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.mediumSpringGreen,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Colors.white,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 2, 2),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          buttonSize: 46,
                                          icon: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: Color(0xFF4B39EF),
                                            size: 16,
                                          ),
                                          onPressed: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType
                                                    .leftToRight,
                                                duration:
                                                    Duration(milliseconds: 300),
                                                reverseDuration:
                                                    Duration(milliseconds: 300),
                                                child: MainScreenWidget(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Text(
                                    'Transaction Details',
                                    style: FlutterFlowTheme.title2,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: FlutterFlowTheme.jet,
                      offset: Offset(0, -2),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 1),
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.jet,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 0, 0, 0),
                                    child: Text(
                                      'Amount',
                                      style: FlutterFlowTheme.title3.override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 20, 0),
                                      child: Row(
                                        children: [
                                          if (widget.transaction.amount.value >
                                              1000000000000)
                                            Text(
                                              '${valueOrDefault<String>(
                                                (widget.transaction.amount.value
                                                            .toDouble() /
                                                        1000000000000)
                                                    .toString(),
                                                '0',
                                              )} SMH',
                                              style: FlutterFlowTheme.title3
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            )
                                          else
                                            Text(
                                              '${valueOrDefault<String>(
                                                (widget.transaction.amount
                                                        .value)
                                                    .toString(),
                                                '0',
                                              )} SMD',
                                              style: FlutterFlowTheme.title3
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: FlutterFlowTheme
                                                    .primaryColor,
                                              ),
                                            ),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 3,
                              indent: 15,
                              endIndent: 15,
                              color: FlutterFlowTheme.primaryColor,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Text(
                                        'Sender',
                                        style:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 20, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await Share.share(hex
                                                .encode(widget
                                                    .transaction.sender.address)
                                                .toString());
                                          },
                                          child: Text(
                                            valueOrDefault<String>(
                                              "0x" +
                                                  hex
                                                      .encode(widget.transaction
                                                          .sender.address)
                                                      .toString()
                                                      .replaceRange(
                                                          4, 36, "..."),
                                              'Not available',
                                            ),
                                            style: FlutterFlowTheme.subtitle2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme
                                                  .mediumSpringGreen,
                                            ),
                                          ),
                                        ))
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 0, 0),
                                      child: Text(
                                        'Receiver',
                                        style:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 20, 0),
                                        child: InkWell(
                                          onTap: () async {
                                            await Share.share(hex
                                                .encode(widget
                                                    .transaction
                                                    .coinTransfer
                                                    .receiver
                                                    .address)
                                                .toString());
                                          },
                                          child: Text(
                                            valueOrDefault<String>(
                                              "0x" +
                                                  hex
                                                      .encode(widget
                                                          .transaction
                                                          .coinTransfer
                                                          .receiver
                                                          .address)
                                                      .toString()
                                                      .replaceRange(
                                                          4, 36, "..."),
                                              'Not available',
                                            ),
                                            style: FlutterFlowTheme.subtitle2
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: FlutterFlowTheme
                                                  .mediumSpringGreen,
                                            ),
                                          ),
                                        ))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 15, 15, 0),
                        child: Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                                child: Text(
                                  'Message',
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.jet,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 3,
                                color: FlutterFlowTheme.mediumSpringGreen,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Text(
                                  valueOrDefault<String>(
                                    functions.getTxMessage(),
                                    'Not available',
                                  ),
                                  style: FlutterFlowTheme.title3.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.jet,
                                  ),
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
