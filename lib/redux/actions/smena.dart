import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/model/smena_data.dart';

class SetSmenaData {
  final ApiResponse<Smena>? response;
  final Smena? smena;

  SetSmenaData({
    required this.response,
    required this.smena,
  });
}
