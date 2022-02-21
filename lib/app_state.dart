import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    secureStorage = new FlutterSecureStorage();
    _userSeed = await secureStorage.read(
        key: 'ff_userSeed'); //prefs.getString('ff_userSeed') ?? _userSeed;
    _selectedNetwork =
        prefs.getString('ff_selectedNetwork') ?? _selectedNetwork;
  }

  SharedPreferences prefs;
  FlutterSecureStorage secureStorage;

  String _userSeed = '';
  String get userSeed => _userSeed;
  set userSeed(String _value) {
    _userSeed = _value;
    secureStorage.write(key: 'ff_userSeed', value: _value);
    //prefs.setString('ff_userSeed', _value);
  }

  String _selectedNetwork = '';
  String get selectedNetwork => _selectedNetwork;
  set selectedNetwork(String _value) {
    _selectedNetwork = _value;
    prefs.setString('ff_selectedNetwork', _value);
  }

  String publicAddress = '';

  Map<dynamic, dynamic> selectedNetworkJson;

  List<int> publicKey = [];

  List<int> privateKey = [];
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
