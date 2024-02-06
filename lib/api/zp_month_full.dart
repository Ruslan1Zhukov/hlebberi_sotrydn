import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_client_dio.dart';
import 'package:hlebberi_sotrydn/model/response/zp_month_data.dart';

abstract class ApiZp {
  static Future<ApiResponse<ReportLabels>> zp({
    required String date,
  }) async {
    final response = await ClientDio.get(
      url: "/employee/monthly-report",
      parameters: {
        "date_month": date,
      },
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => ReportLabels.fromJson(response.data["data"]),
    );
  }
  static Future<ApiResponse<ReportLabels>> zpDetail({
    required String date,
  }) async {
    final response = await ClientDio.get(
      url: "/employee/monthly-report-detail",
      parameters: {
        "date_month": date,
      },
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => ReportLabels.fromJson(response.data["data"]),
    );
  }
  static Future<ApiResponse<ReportLabels>> zpDay({
    required String date,
  }) async {
    final response = await ClientDio.get(
      url: "/employee/daily-report",
      parameters: {
        "date_month": date,
      },
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => ReportLabels.fromJson(response.data["data"]),
    );
  }
}