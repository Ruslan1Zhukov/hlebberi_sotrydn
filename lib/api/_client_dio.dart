import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_dio_response.dart';

const String _domen = "https://test-office-api.hlbr.ru";
const String _path = "/v1";

abstract class ClientDio {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _domen,
      validateStatus: (code) => true,
      connectTimeout: const Duration(seconds: 30),
    ),
  );

  static Future<DioResponse> get({
    required String url,
    Map<String, dynamic>? parameters,
    Object? requestBody,
  }) async {
    return _makeRequest(
      function: () => _dio.get(
        _path + url,
        queryParameters: parameters,
        data: requestBody,
        options: _buildHeaders(),
      ),
    );
  }

  static Future<DioResponse> post({
    required String url,
    Map<String, dynamic>? parameters,
    Object? requestBody,
  }) async {
    return _makeRequest(
      function: () => _dio.post(
        _path + url,
        queryParameters: parameters,
        data: requestBody,
        options: _buildHeaders(),
      ),
    );
  }

  static ApiResponse<T> makeResult<T>({
    required DioResponse response,
    required T Function(Response response) converter,
  }) {
    if (response is DioResponseError) {
      return ApiResponseError(error: response.error);
    } else if (response is DioResponseData) {
      try {
        if (response.response.data["status"] == true) {
          var result = converter(response.response);
          return ApiResponseData(response: result);
        }
        var errors = "Какая-то ошибка";
        return ApiResponseError(error: errors);
      } catch (e) {
        return ApiResponseError(error: "Ошибка получения данных");
      }
    } else {
      return ApiResponseError(error: "Неизвестная ошибка");
    }
  }

  static Future<DioResponse> _makeRequest({
    required Future<Response> Function() function,
  }) async {
    try {
      var response = await function();
      var responseError = _checkResponseError(response);
      if (responseError != null) return responseError;
      return DioResponseData(response: response);
    } catch (error) {
      return _handleError(error);
    }
  }

  static Options _buildHeaders([String? token]) {
    Map<String, String> headers = {};
    if (token != null) {
      headers["Authorization"] = "Bearer $token";
    }
    return Options(headers: headers);
  }

  static DioResponseError? _checkResponseError(
      Response response,
      ) {
    switch (response.statusCode) {
      case 401:
        return DioResponseError(error: "Ошибка авторизации!");
      case 404:
        return DioResponseError(error: "Не найдено");
      default:
        return null;
    }
  }

  static DioResponseError _handleError(error) {
    String errorMessage;
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          errorMessage = 'Время истекло';
          break;
        case DioExceptionType.connectionError:
        case DioExceptionType.unknown:
          errorMessage = 'Ошибка соединения';
          break;
        case DioExceptionType.cancel:
          errorMessage = 'Запрос был отменен';
          break;
        case DioExceptionType.badResponse:
          errorMessage = 'Некорректный ответ от сервера';
          break;
        case DioExceptionType.badCertificate:
          errorMessage = 'Проблема с сертификатом безопасности';
          break;
      }
    } else if (error is SocketException) {
      errorMessage = 'Ошибка соединения с интернетом';
    } else if (error is FormatException) {
      errorMessage = 'Неверный формат данных';
    } else if (error is HttpException) {
      errorMessage = 'Ошибка протокола HTTP';
    } else {
      errorMessage = "Ошибка сети";
    }
    return DioResponseError(error: errorMessage);
  }
}
