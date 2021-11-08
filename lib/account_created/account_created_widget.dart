import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main_screen/main_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountCreatedWidget extends StatefulWidget {
  AccountCreatedWidget({
    Key key,
    this.seed,
  }) : super(key: key);

  final String seed;

  @override
  _AccountCreatedWidgetState createState() => _AccountCreatedWidgetState();
}

class _AccountCreatedWidgetState extends State<AccountCreatedWidget>
    with TickerProviderStateMixin {
  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 1000,
      delay: 1000,
      fadeIn: true,
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 100,
      fadeIn: true,
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      scale: 0.4,
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      slideOffset: Offset(0, -70),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
      backgroundColor: Color(0xFF1E2429),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, FlutterFlowTheme.mediumSpringGreen],
            stops: [0, 1],
            begin: AlignmentDirectional(0.14, -1),
            end: AlignmentDirectional(-0.14, 1),
          ),
        ),
        child: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: MainScreenWidget(
                  seed: widget.seed,
                ),
              ),
            );
          },
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/emojisky.com-9671193.png',
                width: 140,
                height: 140,
                fit: BoxFit.fitHeight,
              ).animated([animationsMap['imageOnPageLoadAnimation']]),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                child: Text(
                  'Welcome to Spacemesh',
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.jet,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ).animated([animationsMap['textOnPageLoadAnimation']]),
              )
            ],
          ),
        ).animated([animationsMap['columnOnPageLoadAnimation']]),
      ).animated([animationsMap['containerOnPageLoadAnimation']]),
    );
  }
}
