enum DayMode {
  last,
  current,
  future;

  double getOpacity() {
    switch (this) {
      case DayMode.last:
        return 0.3;
      case DayMode.current:
        return 1;
      case DayMode.future:
        return 0.7;
    }
  }

  @override
  String toString() {
    switch (this) {
      case DayMode.last:
        return "пр";
      case DayMode.current:
        return "тек";
      case DayMode.future:
        return "буд";
    }
  }
}
