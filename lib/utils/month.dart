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

  String toServer() {
    final now = DateTime.now();
    final yearString = now.year.toString();
    final monthString = toString().padLeft(2, "0");
    return "$yearString-$monthString";
  }
}
