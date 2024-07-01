import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveInfoData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('infoData', true);
}

Future<bool> getInfoData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('infoData') ?? false;
}