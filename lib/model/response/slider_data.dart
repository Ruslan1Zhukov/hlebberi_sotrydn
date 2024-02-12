import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/helpers/color.dart';

class SliderData {
  final Salary salary;
  final WorkSchedule workSchedule;

  SliderData({
    required this.salary,
    required this.workSchedule,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) {
    final salary = Salary.fromJson(json['salary']);
    final workSchedule = WorkSchedule.fromJson(json['work_schedule']);
    return SliderData(
      salary: salary,
      workSchedule: workSchedule,
    );
  }
}

class Salary {
  final int total;
  final Map<String, int> report;
  final Map<String, SalaryLabel> labels;

  Salary({
    required this.total,
    required this.report,
    required this.labels,
  });

  factory Salary.fromJson(Map<String, dynamic> json) {
    final total = json['total'];
    final reportJson = json['report'] as Map<String, dynamic>?;
    final report =
        reportJson?.map((key, value) => MapEntry(key, value as int)) ?? {};
    final labelsJson = json['labels'] as Map<String, dynamic>;
    final labels = labelsJson.map((key, value) =>
        MapEntry(key, SalaryLabel.fromJson(value as Map<String, dynamic>)));
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

  SalaryLabel({
    required this.name,
    required this.colorString,
  });

  factory SalaryLabel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final color = json['color'];
    return SalaryLabel(
      name: name,
      colorString: color,
    );
  }

  Color get color => hexToColor(colorString);
}

class WorkSchedule {
  final Map<String, String> report;
  final Map<String, WorkScheduleLabel> labels;

  WorkSchedule({
    required this.report,
    required this.labels,
  });

  factory WorkSchedule.fromJson(Map<String, dynamic> json) {
    final reportJson = json['report'] as Map<String, dynamic>;
    // final report =
    //     reportJson.map((key, value) => MapEntry(key, value as String));
    // TODO: вернуть
    final labelsJson = json['labels'] as Map<String, dynamic>;
    final labels = labelsJson.map((key, value) => MapEntry(
        key, WorkScheduleLabel.fromJson(value as Map<String, dynamic>)));
    return WorkSchedule(
      report: {}, // TODO: вернуть report
      labels: labels,
    );
  }
}

class WorkScheduleLabel {
  final String colorString;
  final String? iconUrl;

  WorkScheduleLabel({
    required this.colorString,
    required this.iconUrl,
  });

  factory WorkScheduleLabel.fromJson(Map<String, dynamic> json) {
    final color = json['color'];
    final iconUrl = json['iconUrl'];
    return WorkScheduleLabel(
      colorString: color,
      iconUrl: iconUrl,
    );
  }

  Color get color => hexToColor(colorString);

  Widget get icon {
    final iconUrl = this.iconUrl;
    if (iconUrl == null) {
      return const SizedBox.shrink();
    }
    return Image.network(iconUrl);
  }
}
