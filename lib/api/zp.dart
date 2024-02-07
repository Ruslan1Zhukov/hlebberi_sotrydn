import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_client_dio.dart';
import 'package:hlebberi_sotrydn/model/response/day_detail.dart';
import 'package:hlebberi_sotrydn/model/response/month_detail.dart';
import 'package:hlebberi_sotrydn/model/response/slider_data.dart';

abstract class ApiZp {
  static Future<ApiResponse<SliderData>> slider({
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
      converter: (response) => SliderData.fromJson(response.data["data"]),
    );
  }

  static Future<ApiResponse<MonthDetail>> monthDetail({
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
      converter: (response) => MonthDetail.fromJson(response.data["data"]),
    );
  }

  static Future<ApiResponse<DayDetail>> dayDetail({
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
      converter: (response) => DayDetail.fromJson(response.data["data"]),
    );
  }
}
