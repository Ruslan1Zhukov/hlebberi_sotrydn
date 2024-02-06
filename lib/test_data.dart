import 'dart:math';

import 'package:hlebberi_sotrydn/enums/day_type.dart';
import 'package:hlebberi_sotrydn/model/calendar_data.dart';
import 'package:hlebberi_sotrydn/model/response/login_data.dart';
import 'package:hlebberi_sotrydn/model/one_day.dart';
import 'package:hlebberi_sotrydn/model/smena.dart';
import 'package:hlebberi_sotrydn/model/zp.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

final Smena testSmena = Smena(
  timePlan: '10:00-20:00',
  timeFact: '10:05-открыта',
  users: [
    UserSmena(
      avatarUrl:
          "https://media.nazaccent.ru/cache/eb/ae/ebae27a26c6d994b8f36c9699c9bfac8.jpg",
      fio: UserFio(
        firstName: "Иван",
        secondName: "Иванович",
      ),
    ),
    UserSmena(
      avatarUrl:
          "https://static.mk.ru/upload/iblock_mk/475/6a/47/43/DETAIL_PICTURE_568571.jpg",
      fio: UserFio(
        firstName: "Алла",
        secondName: "Геннадьевна",
      ),
    ),
  ],
);

UserSmena _defaultUserSmena = UserSmena(
  avatarUrl: null,
  fio: UserFio(
    firstName: "Имя",
    secondName: "Фамилия",
  ),
);

List<UserSmena> skeletonUsers = [
  _defaultUserSmena,
  _defaultUserSmena,
  _defaultUserSmena,
];


final Map<DateTime, CalendarDay> _calendarData1 = {
  DateTime.utc(2024, 01, 1): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 2): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 3): CalendarDay(type: DayType.p),
  DateTime.utc(2024, 01, 4): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 01, 5): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 6): CalendarDay(type: DayType.p),
  DateTime.utc(2024, 01, 7): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 8): CalendarDay(type: DayType.p),
  DateTime.utc(2024, 01, 9): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 10): CalendarDay(type: DayType.p),
  DateTime.utc(2024, 01, 11): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 01, 12): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 13): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 01, 14): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 15): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 01, 16): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 01, 17): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 01, 18): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 01, 19): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 01, 20): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 01, 21): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 01, 22): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 23): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 01, 24): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 01, 25): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 01, 26): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 01, 27): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 28): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 29): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 01, 30): CalendarDay(type: DayType.o),
};

final Map<DateTime, CalendarDay> _calendarData2 = {
  DateTime.utc(2024, 02, 1): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 2): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 3): CalendarDay(type: DayType.p),
  DateTime.utc(2024, 02, 4): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 02, 5): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 6): CalendarDay(type: DayType.p),
  DateTime.utc(2024, 02, 7): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 8): CalendarDay(type: DayType.p),
  DateTime.utc(2024, 02, 9): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 10): CalendarDay(type: DayType.p),
  DateTime.utc(2024, 02, 11): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 02, 12): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 13): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 02, 14): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 15): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 02, 16): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 02, 17): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 02, 18): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 02, 19): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 02, 20): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 02, 21): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 02, 22): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 23): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 02, 24): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 02, 25): CalendarDay(type: DayType.o),
  DateTime.utc(2024, 02, 26): CalendarDay(type: DayType.night),
  DateTime.utc(2024, 02, 27): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 28): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 29): CalendarDay(type: DayType.k5),
  DateTime.utc(2024, 02, 30): CalendarDay(type: DayType.o),
};

final Map<int, CalendarData> testCalendarData = {
  1: CalendarData(data: _calendarData1),
  2: CalendarData(data: _calendarData2),
};

final Map<int, Zp> testPlotData = {
  1: generateZpMonth(),
  2: generateZpMonth(),
  3: generateZpMonth(),
  4: generateZpMonth(),
};

OneDay testOneDay(DateTime dateTime) => OneDay(
      data: dateTime,
      time: "05:03 - 16:10",
      jobTitle: "Пекарь",
      location: "г. Саранск, ул. Пролетарская, 103",
      zp: generateZpDay(),
    );

Zp generateZpMonth() {
  var value1 = _generateNumber(12000, 1000);
  var value2 = _generateNumber(5000, 500);
  var value3 = _generateNumber(2000, 200);
  var value4 = _generateNumber(500, 100);
  var value5 = _generateNumber(500, 100);
  var sum = value1 + value2 + value3 + value4 + value5 ;
  return Zp(
    sum: sum,
    items: [
      PlotItem(
        name: "Оклад",
        color: ColorProject.orange,
        value: value1,
      ),
      PlotItem(
        name: 'Премия(месяц)',
        color: ColorProject.pink,
        value: value2,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: ColorProject.lightBlue,
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: ColorProject.blue,
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.grayDiagram,
        value: value5,
      ),
    ],
  );
}

Zp generateZpDay() {
  var value1 = _generateNumber(1000, 100);
  var value3 = _generateNumber(600, 50);
  var value4 = _generateNumber(200, 50);
  var value5 = _generateNumber(100, 30);
  var sum = value1 + value3 + value4 - value5;
  return Zp(
    sum: sum,
    items: [
      PlotItem(
        name: "Оклад",
        color: ColorProject.orange,
        value: value1,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: ColorProject.lightBlue,
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: ColorProject.blue,
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.grayDiagram,
        value: value5,
      ),
    ],
  );
}

Zp generateZp() {
  var value1 = _generateNumber(1000, 100);
  var value3 = _generateNumber(600, 50);
  var value4 = _generateNumber(200, 50);
  var value5 = _generateNumber(100, 30);
  var sum = value1 + value3 + value4 - value5;
  return Zp(
    sum: sum,
    items: [
      PlotItem(
        name: "Оклад",
        color: ColorProject.orange,
        value: value1,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: ColorProject.lightBlue,
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: ColorProject.blue,
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.grayDiagram,
        value: value5,
      ),
    ],
  );
}


Zp generateZpMonthDi() {
  var value1 = _generateNumber(12000, 1000);
  var value2 = _generateNumber(5000, 500);
  var value3 = _generateNumber(2000, 200);
  var value4 = _generateNumber(500, 100);
  var value5 = _generateNumber(500, 100);
  var value6 = _generateNumber(500, 100);
  var value7 = _generateNumber(500, 100);
  var value8 = _generateNumber(500, 100);
  var sum = value1 + value2 + value3 + value4 + value5 + value6 + value7 + value8;
  return Zp(
    sum: sum,
    items: [
      PlotItem(
        name: "Оклад",
        color: ColorProject.orange,
        value: value1,
      ),
      PlotItem(
        name: 'Премия(месяц)',
        color: ColorProject.pink,
        value: value2,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: ColorProject.lightBlue,
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: ColorProject.blue,
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.red,
        value: value5,
      ),
      PlotItem(
        name: '',
        color: ColorProject.blue,
        value: value5,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.lightBlue,
        value: value5,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.green,
        value: value5,
      ),
    ],
  );
}


int _generateNumber(int min, int range) {
  return min + Random().nextInt(range);
}
