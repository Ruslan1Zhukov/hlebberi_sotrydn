import 'package:hlebberi_sotrydn/model/day_detail.dart';
import 'package:hlebberi_sotrydn/model/slider_data.dart';

class SetSliderData {
  final int month;
  final SliderData data;

  SetSliderData({
    required this.data,
    required this.month,
  });
}

class SetDayDetailedData {
  final DateTime date;
  final DayDetail data;

  SetDayDetailedData({
    required this.date,
    required this.data,
  });
}

class SetMonthDetailedData {
  final int date;
  final SalaryReport data;

  SetMonthDetailedData({
    required this.date,
    required this.data,
  });
}

class ClearSlider {}
