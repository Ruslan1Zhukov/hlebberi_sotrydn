import 'package:hlebberi_sotrydn/utils/date_time.dart';

const mapMonths = {
  0: "Январь",
  1: "Февраль",
  2: "Март",
  3: "Апрель",
  4: "Май",
  5: "Июнь",
  6: "Июль",
  7: "Август",
  8: "Сентябрь",
  9: "Октябрь",
  10: "Ноябрь",
  11: "Декабрь",
};

extension IntExtension on int {
  DateTime get toDateTime {
    var now = DateTime.now();
    return DateTime.utc(now.year, this, 1);
  }

  String get toMonthString {
    return mapMonths[this] ?? "";
  }

  String get toMonthYearString {
    return "$toMonthString $year";
  }

  int get year {
    final now = DateTime.now();
    final currentYear = now.year;
    final currentMonth = now.monthFrom0;
    if (currentMonth == 11) {
      if (this == 0) return currentYear + 1;
      return currentYear;
    }
    if (this <= (currentMonth + 1)) return currentYear;
    return currentYear - 1;
  }

  int get moveRightMonth {
    if (this >= 11) {
      return 0;
    } else {
      return this + 1;
    }
  }

  int get moveLeftMonth {
    if (this <= 0) {
      return 11;
    } else {
      return this - 1;
    }
  }

  String toServer([int add = 0]) {
    final yearString = year.toString();
    final monthString = (this + add).toString().padLeft(2, "0");
    return "$yearString-$monthString";
  }
}
