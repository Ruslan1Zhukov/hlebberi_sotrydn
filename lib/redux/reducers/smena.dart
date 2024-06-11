import 'package:hlebberi_sotrydn/redux/actions/smena.dart';
import 'package:hlebberi_sotrydn/redux/state/smena.dart';
import 'package:redux/redux.dart';

final smenaReducer = TypedReducer<SmenaState, dynamic>(_smenaReducer);

SmenaState _smenaReducer(SmenaState state, action) {
  switch (action.runtimeType) {
    case SetSmenaData:
      return _setSmenaData(state, action);
    case ClearSmena:
      return _clearSmena(state, action);
  }
  return state;
}

SmenaState _setSmenaData(SmenaState state, SetSmenaData action) {
  state.response = action.response;
  state.smena = action.smena;
  return state;
}

SmenaState _clearSmena(SmenaState state, ClearSmena action) {
  state.response = null;
  state.smena = null;
  return state;
}
