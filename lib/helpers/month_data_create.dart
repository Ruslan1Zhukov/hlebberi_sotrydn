import 'package:hlebberi_sotrydn/model/calendar_data.dart';
import 'package:hlebberi_sotrydn/model/data_month.dart';
import 'package:hlebberi_sotrydn/test_data.dart';

Future<DataMonth> createMonthData([int? month]) async {
  await Future.delayed(const Duration(seconds: 3));
  DateTime date;
  if (month != null) {
    date = DateTime.now().copyWith(month: month);
  } else {
    date = DateTime.now();
  }
  return DataMonth(
    date: date,
    calendar: testCalendarData[month] ?? CalendarData.empty(),
    zp: testPlotData[month],
  );
}
