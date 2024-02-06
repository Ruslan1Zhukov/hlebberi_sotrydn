import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/_client_dio.dart';
import 'package:hlebberi_sotrydn/model/response/smena_data.dart';

abstract class ApiSmena {
  static Future<ApiResponse<SmenaData>> smena({
    required String date,
  }) async {
    final response = await ClientDio.get(
      url: "/employee/today-shift-info",
    );
    return ClientDio.makeResult(
      response: response,
      converter: (response) => SmenaData.fromJson(response.data["data"]),
    );
  }
}
