import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../tx_detail/tx_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class TxRewardWidget extends StatefulWidget {
  TxRewardWidget({
    Key key,
    this.amount,
  }) : super(key: key);

  final double amount;

  @override
  _TxRewardWidgetState createState() => _TxRewardWidgetState();
}

class _TxRewardWidgetState extends State<TxRewardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 5, 15, 5),
      child: Container(
        width: double.infinity,
        height: 75,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.jet,
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
                child: TxDetailWidget(),
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
                  color: Color(0x6F3AFFA7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0x6F3AFFA7),
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
                            color: FlutterFlowTheme.primaryColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.mediumSpringGreen,
                            ),
                          ),
                          child: Image.asset(
                            'assets/images/SPACEMESH_LOGO_-_BLACK.png',
                            width: 45,
                            height: 45,
                            fit: BoxFit.cover,
                          ),
                        )
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
                        'Mining Rewards',
                        style: FlutterFlowTheme.subtitle1.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: Text(
                          'Income',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
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
                    if (widget.amount > 1000000000000)
                      Text(
                        '${valueOrDefault<String>(
                          (widget.amount / 1000000000000).toString(),
                          '0',
                        )} SMH',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.mediumSpringGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    else
                      Text(
                        '${valueOrDefault<String>(
                          (widget.amount).toString(),
                          '0',
                        )} SMD',
                        textAlign: TextAlign.end,
                        style: FlutterFlowTheme.subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.mediumSpringGreen,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
