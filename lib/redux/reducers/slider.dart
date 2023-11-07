import 'package:hlebberi_sotrydn/redux/actions/slider.dart';
import 'package:hlebberi_sotrydn/redux/state/slider.dart';
import 'package:redux/redux.dart';

final sliderReducer = TypedReducer<SliderState, dynamic>(_sliderReducer);

SliderState _sliderReducer(SliderState state, action) {
  switch (action.runtimeType) {
    case SetSliderData:
      return _setSliderData(state, action);
  }
  return state;
}

SliderState _setSliderData(SliderState state, SetSliderData action) {
  state.data[action.month] = action.data;
  return state;
}

