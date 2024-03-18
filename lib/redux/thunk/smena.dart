import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/smena.dart';
import 'package:hlebberi_sotrydn/model/smena_data.dart';
import 'package:hlebberi_sotrydn/redux/actions/smena.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

/// Установить данные по смене
ThunkAction<AppState> setSmenaData() {
  return (Store<AppState> store) async {
    final response = await ApiSmena.smena();
    final smena = (response is ApiResponseData)
        ? (response as ApiResponseData<Smena>).data
        : null;
    await store.dispatch(SetSmenaData(response: response, smena: smena));
  };
}
