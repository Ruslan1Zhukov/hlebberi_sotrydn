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
}
