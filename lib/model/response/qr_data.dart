class ShiftAccessToken {
  final String token;

  ShiftAccessToken({required this.token});

  factory ShiftAccessToken.fromJson(Map<String, dynamic> json) {
    return ShiftAccessToken(
      token: json['token'],
    );
  }
}

class Data {
  final ShiftAccessToken shiftAccessToken;

  Data({required this.shiftAccessToken});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      shiftAccessToken: ShiftAccessToken.fromJson(json['shift_access_token']),
    );
  }
}

class Response {
  final bool status;
  final Data data;

  Response({required this.status, required this.data});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}
