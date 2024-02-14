import 'dart:convert';

import 'package:hlebberi_sotrydn/model/login_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveLoginData(LoginData? data) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  if (data == null) {
    await prefs.remove('loginData');
    return;
  }
  final json = jsonEncode(data.toJson());
  await prefs.setString('loginData', json);
}

Future<LoginData?> getLoginData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final json = prefs.getString('loginData');
  if (json == null) return null;
  try {
    final data = jsonDecode(json);
    return LoginData.fromJson(data);
  } catch (e) {
    return null;
  }
}