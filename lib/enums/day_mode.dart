import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

enum DayMode {
  last,
  current,
  future;

  Color get colorBorder => _isToday ? const Color(0xFFFDD733) : ColorProject.grey;

  double get widthBorder => _isToday ? 4.0 : 1.0;

  double getOpacity() {
    switch (this) {
      case DayMode.last:
        return 0.7;
      case DayMode.current:
        return 1;
      case DayMode.future:
        return 1;
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

  bool get _isToday => this == DayMode.current;
}
