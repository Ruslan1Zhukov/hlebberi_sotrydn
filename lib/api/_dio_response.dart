import 'package:dio/dio.dart';

class DioResponse<T> {
  final Response? response;
  final String? error;

  DioResponse({
    this.response,
    this.error,
  });
}

class DioResponseError<T> extends DioResponse {
  @override
  String get error {
    return super.error ?? "";
  }

  DioResponseError({
    required super.error,
  }) : super(response: null);

  DioResponseError.standard()
      : super(error: "Возникла ошибка\nОбратитесь к администратору");
}

class DioResponseData<T> extends DioResponse {
  @override
  Response get response {
    var response = super.response;
    if (response == null) throw Exception();
    return response;
  }

  DioResponseData({
    required super.response,
  });
}