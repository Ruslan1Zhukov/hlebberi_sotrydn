import 'package:hlebberi_sotrydn/helpers/month_data_create.dart';
import 'package:hlebberi_sotrydn/redux/actions/slider.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

ThunkAction<AppState> setMonthData(int month) {
  return (Store<AppState> store) async {
    var newData = await createMonthData(month);
    store.dispatch(SetSliderData(
      data: newData,
      month: month,
    ));
  };
}
