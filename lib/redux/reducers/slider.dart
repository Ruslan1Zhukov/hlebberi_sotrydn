import 'package:hlebberi_sotrydn/redux/actions/slider.dart';
import 'package:hlebberi_sotrydn/redux/state/slider.dart';
import 'package:redux/redux.dart';

final sliderReducer = TypedReducer<SliderState, dynamic>(_sliderReducer);

SliderState _sliderReducer(SliderState state, action) {
  switch (action.runtimeType) {
    case SetSliderData:
      return _setSliderData(state, action);
    case SetDayDetailedData:
      return _setDayDetailedData(state, action);
    case SetMonthDetailedData:
      return _setMonthDetailedData(state, action);
    case ClearSlider:
      return _clear(state, action);
  }
  return state;
}

SliderState _setSliderData(SliderState state, SetSliderData action) {
  state.data[action.month] = action.data;
  return state;
}

SliderState _setDayDetailedData(SliderState state, SetDayDetailedData action) {
  state.days[action.date] = action.data;
  return state;
}

SliderState _setMonthDetailedData(SliderState state, SetMonthDetailedData action) {
  state.month[action.date] = action.data;
  return state;
}

SliderState _clear(SliderState state, ClearSlider action) {
  state.data = {};
  state.days = {};
  state.month = {};
  return state;
}


