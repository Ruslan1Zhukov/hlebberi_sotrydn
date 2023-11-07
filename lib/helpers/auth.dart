import 'package:shared_preferences/shared_preferences.dart';

Future<void> setAuth(bool auth) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('auth', auth);
}

Future<bool> gatAuth() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('auth') ?? false;
}