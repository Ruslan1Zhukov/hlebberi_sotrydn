import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hlebberi_sotrydn/helpers/color.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/utils/parser.dart';

class SliderData {
  final Salary salary;
  final WorkSchedule workSchedule;

  SliderData({
    required this.salary,
    required this.workSchedule,
  });

  static SliderData? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final salary = Salary.fromJson(json['salary']) ?? Salary.empty();
    final workSchedule =
        WorkSchedule.fromJson(json['work_schedule']) ?? WorkSchedule.empty();
    return SliderData(
      salary: salary,
      workSchedule: workSchedule,
    );
  }
}

class Salary {
  final bool isNormal;
  final int total;
  final Map<String, int> report;
  final Map<String, SalaryLabel> labels;

  Salary({
    this.isNormal = true,
    required this.total,
    required this.report,
    required this.labels,
  });

  Salary.empty()
      : isNormal = false,
        total = 0,
        report = {},
        labels = {};

  static Salary? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final total = json.getIntOrNull('total');
    final Map<String, int> report = json.getMap(
      key: 'report',
      converter: (v) => (double.tryParse(v.toString()) ?? 0.0).toInt(),
    );
    final Map<String, SalaryLabel> labels = json.getMap(
      key: 'labels',
      converter: (v) => SalaryLabel.fromJson(v as Map<String, dynamic>)!,
    );
    if (total == null) return null;
    return Salary(
      total: total,
      report: report,
      labels: labels,
    );
  }

  double sumDouble() {
    double sum = 0;
    report.forEach((key, value) {
      sum += value;
    });
    return sum;
  }
}

class SalaryLabel {
  final String name;
  final String colorString; // "#FDD733"
  final String? coloredString;

  SalaryLabel({
    required this.name,
    required this.colorString,
    this.coloredString,
  });

  static SalaryLabel? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final name = json.getStringOrNull('name');
    final colorString = json.getStringOrNull('color');
    final coloredString =
        json.getBoolOrNull('number_colored') == true ? "#DC3545" : "000000";
    if (name == null || colorString == null) return null;
    return SalaryLabel(
      name: name,
      colorString: colorString,
      coloredString: coloredString,
    );
  }

  Color get color => hexToColor(colorString) ?? ColorProject.black;

  Color? get colored => hexToColor(coloredString);
}

class WorkSchedule {
  final bool isNormal;
  final Map<String, String> report;
  final Map<String, WorkScheduleLabel> labels;
  final Set<String> existDates;
  final Set<String> truancies;
  final int count;

  WorkSchedule({
    this.isNormal = true,
    required this.report,
    required this.labels,
    required this.existDates,
    required this.count,
    required this.truancies,
  });

  WorkSchedule.empty()
      : isNormal = false,
        report = {},
        labels = {},
        count = 0,
        existDates = {},
        truancies = {};

  static WorkSchedule? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    Map<String, String> report = {};
    Set<String> existDates = {};
    Set<String> truancies = {};
    Map<String, dynamic> jsonReport = json['report'];
    report = jsonReport.getMap(
      key: 'items',
      converter: (v) => v.toString(),
    );
    existDates = jsonReport.getSet(
      key: 'shift_user_exist_dates',
      converter: (v) => v.toString(),
    );
    final Map<String, WorkScheduleLabel> labels = json.getMap(
      key: 'labels',
      converter: (v) => WorkScheduleLabel.fromJson(v)!,
    );
    truancies = jsonReport.getSet(
      key: 'truancies',
      converter: (v) => v.toString(),
    );
    final count = jsonReport.getInt("count_work_schedules");

    return WorkSchedule(
      report: report,
      labels: labels,
      existDates: existDates,
      count: count,
      truancies: truancies,
    );
  }
}

class WorkScheduleLabel {
  final String colorString;
  final String? iconUrl;
  final String? image;
  final String name;

  WorkScheduleLabel({
    required this.colorString,
    required this.iconUrl,
    required this.image,
    required this.name,
  });

  static WorkScheduleLabel? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final color = json['color'] as String?;
    final iconUrl = json['iconUrl'] as String?;
    final image = json['image'] as String?;
    final name = json['name'] as String;
    if (color == null) return null;
    return WorkScheduleLabel(
      name: name,
      colorString: color,
      iconUrl: iconUrl,
      image: image,
    );
  }

  Color get color => hexToColor(colorString) ?? ColorProject.black;

  Widget get icon {
    final iconUrl = this.iconUrl;
    if (iconUrl == null) {
      return const SizedBox.shrink();
    }
    return SvgPicture.network(
      iconUrl,
      width: 20,
      height: 20,
    );
  }

  Widget get imagePlaceholder {
    final image = this.image;
    if (image == null) {
      return const SizedBox.shrink();
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        return SvgPicture.network(
          image,
          width: constraints.maxWidth,
          height: 300,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
