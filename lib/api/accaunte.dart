import 'dart:convert';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_client_dio.dart';
import '../model/login_data.dart';

abstract class ApiAccount {
  static Future<ApiResponse<LoginData>> login({
    required String login,
    required String password,
  }) async {
    final data = {
      "email": login,
      "password": password,
      "type": "employee",
    };
    final json = jsonEncode(data);
    final response = await ClientDio.post(
      url: "/auth/login",
      requestBody: json,
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => LoginData.fromJson(response.data["data"]),
    );
  }
  static Future<ApiResponse<UserData>> getUserData() async {
    final response = await ClientDio.get(
      url: "/auth/login",
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => UserData.fromJson(response.data["data"]),
    );
  }
  static Future<ApiResponse<void>> logout() async {
    final response = await ClientDio.post(
      url: "/auth/logout",
    );
    return ClientDio.makeResult(response: response);
  }
}
