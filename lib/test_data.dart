import 'dart:math';

import 'package:hlebberi_sotrydn/enums/day_type.dart';
import 'package:hlebberi_sotrydn/model/calendar_data.dart';
import 'package:hlebberi_sotrydn/model/one_day.dart';
import 'package:hlebberi_sotrydn/model/smena.dart';
import 'package:hlebberi_sotrydn/model/user.dart';
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

final User testUser = User(
  id: 0,
  fio: UserFio(
    firstName: "Руслан",
    secondName: "Жуков",
  ),
  jobTitle: "Пекарь",
  // avatarUrl: null,
  avatarUrl:
      "https://sun6-20.userapi.com/impg/pGrdQf0S3nTSFtCyjKIkWdL_uwzsHsV3-2STwg/GfcGEPiVRX0.jpg?size=810x1080&quality=95&sign=bf91e0cfbc114e073ae2236aa8ade949&type=album",
  location: "г. Саранск, ул. Пролетарская, 103",
);

final Map<DateTime, CalendarDay> _calendarData9 = {
  DateTime.utc(2023, 9, 30): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 9, 31): CalendarDay(type: DayType.k5),
};

final Map<DateTime, CalendarDay> _calendarData10 = {
  DateTime.utc(2023, 01, 1): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 2): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 3): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 01, 4): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 01, 5): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 6): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 01, 7): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 8): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 01, 9): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 10): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 01, 11): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 01, 12): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 13): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 01, 14): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 15): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 01, 16): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 01, 17): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 01, 18): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 01, 19): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 01, 20): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 01, 21): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 01, 22): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 23): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 01, 24): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 01, 25): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 01, 26): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 01, 27): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 28): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 29): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 01, 30): CalendarDay(type: DayType.o),
};

final Map<DateTime, CalendarDay> _calendarData11 = {
  DateTime.utc(2023, 12, 1): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 2): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 3): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 12, 4): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 12, 5): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 6): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 12, 7): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 8): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 12, 9): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 10): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 12, 11): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 12, 12): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 13): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 12, 14): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 15): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 12, 16): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 12, 17): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 12, 18): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 12, 19): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 12, 20): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 12, 21): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 12, 22): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 23): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 12, 24): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 12, 25): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 12, 26): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 12, 27): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 28): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 29): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 12, 30): CalendarDay(type: DayType.o),
};

final Map<int, CalendarData> testCalendarData = {
  10: CalendarData(data: _calendarData9),
  11: CalendarData(data: _calendarData10),
  12: CalendarData(data: _calendarData11),
};

final Map<int, Zp> testPlotData = {
  9: _generateZpMonth(),
  10: _generateZpMonth(),
  11: _generateZpMonth(),
  12: _generateZpMonth(),
};

OneDay testOneDay(DateTime dateTime) => OneDay(
      data: dateTime,
      time: "05:03 - 16:10",
      jobTitle: "Пекарь",
      location: "г. Саранск, ул. Пролетарская, 103",
      zp: generateZpDay(),
    );

Zp _generateZpMonth() {
  var value1 = _generateNumber(12000, 1000);
  var value2 = _generateNumber(5000, 500);
  var value3 = _generateNumber(2000, 200);
  var value4 = _generateNumber(500, 100);
  var value5 = _generateNumber(500, 100);
  var sum = value1 + value2 + value3 + value4 - value5;
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

int _generateNumber(int min, int range) {
  return min + Random().nextInt(range);
}
