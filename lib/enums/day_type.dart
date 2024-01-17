import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

enum DayType {
  p,
  night,
  k5,
  o,
  plus,
  b;

  Widget getLabelWidget() {
    switch (this) {
      case DayType.p:
        return const Text("П");
      case DayType.night:
        return SvgPicture.asset("assets/icons/icon_night.svg");
      case DayType.k5:
        return const Text("К5");
      case DayType.plus:
        return SvgPicture.asset("assets/icons/icon_night.svg");
      case DayType.o:
        return SvgPicture.asset("assets/icons/icon_airplane.svg");
      case DayType.b:
        return SvgPicture.asset("assets/icons/icon_bol.svg");
    }
  }

  Color getColor() {
    switch (this) {
      case DayType.p:
        return ColorProject.orange;
      case DayType.night:
        return ColorProject.lightBlue;
      case DayType.k5:
        return ColorProject.orange;
      case DayType.o:
        return ColorProject.lightGreen;
      case DayType.plus:
        return ColorProject.lightBlue;
      case DayType.b:
        return ColorProject.pink;
    }
  }

  @override
  String toString() {
    switch (this) {
      case DayType.p:
        return "p";
      case DayType.night:
        return "n";
      case DayType.k5:
        return "k5";
      case DayType.plus:
        return "+";
      case DayType.o:
        return "o";
      case DayType.b:
        return "b";
    }
  }
}
