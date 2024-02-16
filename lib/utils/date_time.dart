import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

extension DateTimeExtension on DateTime {
  DateTime firstDayOfMonth() {
    return DateTime.utc(year, month, 1);
  }

  int get monthFrom0 => month - 1;

  DateTime addMonth() {
    var newDatetime = Jiffy.parseFromDateTime(this).add(months: 1).dateTime;
    return newDatetime;
  }

  DateTime subtractMonth() {
    var newDatetime =
        Jiffy.parseFromDateTime(this).subtract(months: 1).dateTime;
    return newDatetime;
  }

  String dMMMM(BuildContext context) {
    return DateFormat(
      "d MMMM",
      "ru",
    ).format(this);
  }

  String dMMMMDayOfWeek(BuildContext context) {
    return DateFormat(
      "d MMMM (E)",
      "ru",
    ).format(this);
  }

  String hhmm(BuildContext context) {
    return DateFormat(
      "hh:mm",
      "ru",
    ).format(this);
  }

  String yyyy_mm_dd(BuildContext context) {
    return DateFormat(
      "yyyy-MM-dd",
      "ru",
    ).format(this);
  }

  String get toServer => DateFormat("yyyy-MM", "ru").format(this);

  bool isCurrent() {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }
}
