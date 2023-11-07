import 'package:hlebberi_sotrydn/redux/app_reducers.dart';
import 'package:hlebberi_sotrydn/redux/state/account.dart';
import 'package:hlebberi_sotrydn/redux/state/slider.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class AppState {
  final Account account;
  final SliderState slider;

  const AppState({
    required this.account,
    required this.slider,
  });

  AppState.initState()
      : account = Account(),
        slider = SliderState();
}

final store = Store<AppState>(
  appStateReducer,
  initialState: AppState.initState(),
  middleware: [
    thunkMiddleware,
  ],
);