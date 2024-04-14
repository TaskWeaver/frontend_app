import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return SharedPreferencesService._internal();
  }
  SharedPreferences? _prefs;

  Future<SharedPreferences?> get _initializePrefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  Future<String> getString(String key) async {
    var pref = await _initializePrefs;
    return pref?.getString(key) ?? '';
  }

  Future<void> setString(String key, String? value) async {
    var pref = await _initializePrefs;
    await pref?.setString(key, value ?? '');
  }

  Future<bool> getBool(String key) async {
    var pref = await _initializePrefs;
    return pref?.getBool(key) ?? false;
  }

  Future<void> setBool(String key, bool value) async {
    var pref = await _initializePrefs;
    await pref?.setBool(key, value);
  }
}
