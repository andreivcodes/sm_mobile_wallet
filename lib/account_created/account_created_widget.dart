import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main_screen/main_screen_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountCreatedWidget extends StatefulWidget {
  const AccountCreatedWidget({
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
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'columnOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 100,
      fadeIn: true,
      initialState: AnimationState(
        opacity: 0,
      ),
      finalState: AnimationState(
        opacity: 1,
      ),
    ),
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 1100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 70),
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        opacity: 1,
      ),
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, FlutterFlowTheme.of(context).primaryColor],
            stops: [0, 1],
            begin: AlignmentDirectional(0.14, -1),
            end: AlignmentDirectional(-0.14, 1),
          ),
        ),
        child: InkWell(
          onTap: () async {
            var privk =
                (await functions.getPrivatekeyFromSeed(FFAppState().userSeed))
                    .toList();
            var pubk =
                (await functions.getPublickeyFromSeed(FFAppState().userSeed))
                    .toList();
            var pubadd = (await functions
                .getPublicaddressFromSeed(FFAppState().userSeed));
            var selnet =
                (await functions.getNetworkJson(FFAppState().selectedNetwork));

            await functions.connectNetwork(selnet);

            setState(() => FFAppState().privateKey = privk);
            setState(() => FFAppState().publicKey = pubk);
            setState(() => FFAppState().publicAddress = pubadd);
            setState(() => FFAppState().selectedNetworkJson = selnet);

            await Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                duration: Duration(milliseconds: 300),
                reverseDuration: Duration(milliseconds: 300),
                child: MainScreenWidget(),
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
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Lexend Deca',
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                ).animated([animationsMap['textOnPageLoadAnimation']]),
              ),
            ],
          ),
        ).animated([animationsMap['columnOnPageLoadAnimation']]),
      ).animated([animationsMap['containerOnPageLoadAnimation']]),
    );
  }
}
