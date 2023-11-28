import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/enums/day_type.dart';
import 'package:hlebberi_sotrydn/model/calendar_data.dart';
import 'package:hlebberi_sotrydn/model/one_day.dart';
import 'package:hlebberi_sotrydn/model/smena.dart';
import 'package:hlebberi_sotrydn/model/user.dart';
import 'package:hlebberi_sotrydn/model/zp.dart';

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
  DateTime.utc(2023, 10, 1): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 2): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 3): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 10, 4): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 10, 5): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 6): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 10, 7): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 8): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 10, 9): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 10): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 10, 11): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 10, 12): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 13): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 10, 14): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 15): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 10, 16): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 10, 17): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 10, 18): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 10, 19): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 10, 20): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 10, 21): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 10, 22): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 23): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 10, 24): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 10, 25): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 10, 26): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 10, 27): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 28): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 29): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 10, 30): CalendarDay(type: DayType.o),
};

final Map<DateTime, CalendarDay> _calendarData11 = {
  DateTime.utc(2023, 11, 1): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 2): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 3): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 11, 4): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 11, 5): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 6): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 11, 7): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 8): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 11, 9): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 10): CalendarDay(type: DayType.p),
  DateTime.utc(2023, 11, 11): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 11, 12): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 13): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 11, 14): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 15): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 11, 16): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 11, 17): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 11, 18): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 11, 19): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 11, 20): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 11, 21): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 11, 22): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 23): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 11, 24): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 11, 25): CalendarDay(type: DayType.o),
  DateTime.utc(2023, 11, 26): CalendarDay(type: DayType.night),
  DateTime.utc(2023, 11, 27): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 28): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 29): CalendarDay(type: DayType.k5),
  DateTime.utc(2023, 11, 30): CalendarDay(type: DayType.o),
};

final Map<int, CalendarData> testCalendarData = {
  9: CalendarData(data: _calendarData9),
  10: CalendarData(data: _calendarData10),
  11: CalendarData(data: _calendarData11),
};

final Map<int, Zp> testPlotData = {
  8: _generateZpMonth(),
  9: _generateZpMonth(),
  10: _generateZpMonth(),
  11: _generateZpMonth(),
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
        color: const Color(0xFFFFC107),
        value: value1,
      ),
      PlotItem(
        name: 'Премия(месяц)',
        color: const Color(0xFFFE8382),
        value: value2,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: const Color(0xFFA0B1FF),
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: const Color(0xFF6B7AFF),
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: const Color(0xFFE5E5E5),
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
        color: const Color(0xFFFFC107),
        value: value1,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: const Color(0xFFA0B1FF),
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: const Color(0xFF6B7AFF),
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: const Color(0xFFE5E5E5),
        value: value5,
      ),
    ],
  );
}

int _generateNumber(int min, int range) {
  return min + Random().nextInt(range);
}
