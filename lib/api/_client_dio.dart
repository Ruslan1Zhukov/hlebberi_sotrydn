import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http_parser/http_parser.dart';
import 'package:order/api_client/_api_response.dart';
import 'package:order/api_client/_dio_response.dart';
import 'package:order/helpers/data_formatting.dart';
import 'package:order/interfaces/params.dart';
import 'package:order/model/enum/body_type.dart';
import 'package:order/model/request_params.dart';
import 'package:order/redux/app_state.dart';
import 'package:order/redux/thunk/account.dart';

final String _domen = dotenv.env['API_DOMEN']!;
final String _path = dotenv.env['API_BASE_PATH']!;

/// Базовый класс для работы с API
abstract class ClientDio {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _domen,
      validateStatus: (code) => true,
      connectTimeout: const Duration(minutes: 1),
      responseType: ResponseType.json,
    ),
  );

  Future<DioResponse> get(RequestParams params) async {
    return _makeRequest(
      function: () => _dio.get(
        _path + params.url,
        queryParameters: params.queryParameters,
        data: _toJson(params.body),
        options: _buildHeaders(params),
      ),
    );
  }

  Future<DioResponse> post(RequestParams params) async {
    return _makeRequest(
      function: () => _dio.post(
        _path + params.url,
        queryParameters: params.queryParameters,
        data: _toJson(params.body),
        options: _buildHeaders(params),
      ),
    );
  }

  Future<DioResponse> edit(RequestParams params) async {
    return _makeRequest(
      function: () => _dio.put(
        _path + params.url,
        queryParameters: params.queryParameters,
        data: _toJson(params.body),
        options: _buildHeaders(params),
      ),
    );
  }

  Future<DioResponse> put(RequestParams params) async {
    var queryParameters = params.queryParameters;
    if (queryParameters == null) {
      return DioResponseError(error: "Нет параметров");
    }
    FormData formData = FormData.fromMap(queryParameters);
    return _makeRequest(
      function: () => _dio.put(
        _path + params.url,
        data: (params.bodyType == BodyType.formData)
            ? formData
            : params.queryParameters,
        options: _buildHeaders(params),
      ),
    );
  }

  Future<DioResponse> put2(RequestParams params) async {
    return _makeRequest(
      function: () => _dio.put(
        _path + params.url,
        data: _toJson(params.body),
        options: _buildHeaders(params),
      ),
    );
  }

  Future<DioResponse> multipart(RequestParams params) async {
    var queryParameters = params.queryParameters;
    if (queryParameters == null) {
      return DioResponseError(error: "Нет параметров");
    }
    FormData formData = FormData.fromMap(queryParameters);
    return _makeRequest(
      function: () => _dio.post(
        _path + params.url,
        data: formData,
        options: _buildHeaders(params),
      ),
    );
  }

  Future<DioResponse> file(RequestParams params) async {
    var file = params.attachment?.getFile();
    if (file == null) {
      return DioResponseError(error: "Нет прикреплённого файла");
    }
    var extension = file.path.split('.').last.toLowerCase();
    MediaType? contentType;
    switch (extension) {
      case "jpg":
      case "jpeg":
        contentType = MediaType("image", "jpeg");
        break;
      case "png":
        contentType = MediaType("image", "png");
        break;
    }
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
        contentType: contentType,
      ),
    });
    return _makeRequest(
      function: () => _dio.post(
        _path + params.url,
        queryParameters: params.queryParameters,
        data: formData,
        options: _buildHeaders(params),
      ),
    );
  }

  Future<DioResponse> signOut(RequestParams params) async {
    var queryParameters = params.queryParameters;
    if (queryParameters == null) {
      return DioResponseError(error: "Нет параметров");
    }
    FormData formData = FormData.fromMap(queryParameters);
    return _makeRequest(
      function: () => _dio.post(
        _path + params.url,
        data: formData,
        options: _buildHeaders(params),
      ),
      withNavigation: false,
    );
  }

  ApiResponse<T> makeResult<T>({
    required DioResponse response,
    required T Function(Response response) converter,
  }) {
    if (response is DioResponseError) {
      return ApiResponseError(error: response.error);
    } else if (response is DioResponseData) {
      try {
        if (response.response.data["Success"] == true) {
          var result = converter(response.response);
          return ApiResponseData(response: result);
        }
        var errors = processResponseErrors(response.response.data["Errors"]);
        return ApiResponseError(error: errors.join('; '));
      } catch (e) {
        return ApiResponseError(error: "Ошибка получения данных");
      }
    } else {
      return ApiResponseError(error: "Неизвестная ошибка");
    }
  }

  Future<DioResponse> _makeRequest({
    required Future<Response> Function() function,
    bool withNavigation = true,
  }) async {
    try {
      var response = await function();
      var responseError = _checkResponseError(response, withNavigation);
      if (responseError != null) return responseError;
      return DioResponseData(response: response);
    } catch (error) {
      return _handleError(error);
    }
  }

  Options _buildHeaders(RequestParams params) {
    Map<String, String> headers = {
      "Content-Type": params.bodyType.contentType,
    };
    if (params.auth) {
      var token = store.state.account.userToken;
      if (token != null) {
        headers["Authorization"] = token.bearer();
      }
    }
    return Options(headers: headers);
  }

  DioResponseError? _checkResponseError(Response response, bool withNavigation) {
    switch (response.statusCode) {
      case 401:
        if (withNavigation) store.dispatch(logout());
        return DioResponseError(error: "Ошибка авторизации!");
      default:
        return null;
    }
  }

  DioResponseError _handleError(error) {
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

  String? _toJson(ObjectToParams? object) {
    if (object == null) return null;
    var params = object.toParams();
    return jsonEncode(params);
  }
}