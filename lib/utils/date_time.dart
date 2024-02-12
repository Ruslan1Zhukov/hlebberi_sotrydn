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
      Localizations.localeOf(context).languageCode,
    ).format(this);
  }

  String dMMMMDayOfWeek(BuildContext context) {
    return DateFormat(
      "d MMMM (E)",
      Localizations.localeOf(context).languageCode,
    ).format(this);
  }

  String hhmm(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;
    debugPrint("languageCode=$languageCode");
    return DateFormat(
      "hh:mm",
      Localizations.localeOf(context).languageCode,
    ).format(this);
  }

  String yyyy_mm_dd(BuildContext context) {
    return DateFormat(
      "yyyy-MM-dd",
      Localizations.localeOf(context).languageCode,
    ).format(this);
  }
}
