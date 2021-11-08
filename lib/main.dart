import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sm_mobile_wallet/main_screen/main_screen_widget.dart';
import 'package:sm_mobile_wallet/welcome_onboarding/welcome_onboarding_widget.dart';
import 'package:window_utils/window_utils.dart';
import 'package:bip39/bip39.dart' as bip39;
import '../flutter_flow/custom_functions.dart' as functions;

String secretSeed;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    WindowUtils.setSize(Size(450, 850));
  }
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getBool('first_run') ?? true) {
    FlutterSecureStorage storage = FlutterSecureStorage();
    await storage.deleteAll();
    prefs.setBool('first_run', false);
  }

  final storage = new FlutterSecureStorage();

  secretSeed = await storage.read(key: "seed");
  if (bip39.validateMnemonic(secretSeed)) {
    await functions.getKeypairFromSeedPhrase(secretSeed);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (bip39.validateMnemonic(secretSeed)) {
      return MaterialApp(
        title: 'sm-mobile-wallet',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainScreenWidget(
          seed: secretSeed,
        ),
      );
    } else
      return MaterialApp(
        title: 'sm-mobile-wallet',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(primarySwatch: Colors.blue),
        home: WelcomeOnboardingWidget(),
      );
  }
}
