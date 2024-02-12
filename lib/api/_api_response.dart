class ApiResponse<T> {
  final T? data;
  final String? error;

  ApiResponse({
    this.data,
    this.error,
  });
}

class ApiResponseError<T> extends ApiResponse<T> {
  @override
  String get error {
    return super.error ?? "";
  }

  ApiResponseError({
    required super.error,
  }) : super(data: null);

  ApiResponseError.standard()
      : super(error: "Возникла ошибка\nОбратитесь к администратору");

  @override
  String toString() => "ApiResponseError($error)";
}

class ApiResponseData<T> extends ApiResponse<T> {
  @override
  T get data {
    var response = super.data;
    if (response == null) throw Exception();
    return response;
  }

  ApiResponseData({
    required super.data,
  });

  @override
  String toString() => "ApiResponseData(${data.toString()})";
}