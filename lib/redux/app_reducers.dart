import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/reducers/account.dart';
import 'package:hlebberi_sotrydn/redux/reducers/slider.dart';
import 'package:hlebberi_sotrydn/redux/reducers/smena.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    account: accountReducer(state.account, action),
    slider: sliderReducer(state.slider, action),
    smena: smenaReducer(state.smena, action),
  );
}
