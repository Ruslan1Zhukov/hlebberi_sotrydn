import 'package:hlebberi_sotrydn/enums/day_type.dart';

class CalendarData {
  Map<DateTime, CalendarDay> data;

  CalendarData({
    required this.data,
  });

  CalendarData.empty() : data = {};
}

class CalendarDay {
  final DayType type;

  CalendarDay({
    required this.type,
  });

  CalendarDay.empty() : type = DayType.plus;
}
