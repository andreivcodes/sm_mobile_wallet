import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../tx_detail/tx_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TxEntryWidget extends StatefulWidget {
  const TxEntryWidget({Key key, this.txJson}) : super(key: key);

  final dynamic txJson;

  @override
  _TxEntryWidgetState createState() => _TxEntryWidgetState();
}

class _TxEntryWidgetState extends State<TxEntryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).jet,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: TxDetailWidget(
                  tx: widget.txJson,
                ),
              ),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8, 5, 0, 5),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: widget.txJson.type == "incoming"
                      ? Color(0x6F3AFFA7)
                      : Color(0xFFFCC1A8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: widget.txJson.type == "incoming"
                          ? Color(0x6F3AFFA7)
                          : Color(0xFFFCC1A8),
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: widget.txJson.type == "incoming"
                                ? FlutterFlowTheme.of(context).mediumSpringGreen
                                : FlutterFlowTheme.of(context).secondaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: widget.txJson.type == "incoming"
                                  ? FlutterFlowTheme.of(context)
                                      .mediumSpringGreen
                                  : FlutterFlowTheme.of(context).secondaryColor,
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_circle_down_rounded,
                            color: FlutterFlowTheme.of(context).jet,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transfer',
                        style: FlutterFlowTheme.of(context).subtitle1.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          widget.txJson.type,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.txJson.amount > 1000000000000 ? (widget.txJson.amount / 1000000000000).toString() + " SMH" : (widget.txJson.amount).toString() + " SMD"}',
                      textAlign: TextAlign.end,
                      style: FlutterFlowTheme.of(context).subtitle2.override(
                            fontFamily: 'Lexend Deca',
                            color: widget.txJson.type == "incoming"
                                ? FlutterFlowTheme.of(context).mediumSpringGreen
                                : FlutterFlowTheme.of(context).secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
