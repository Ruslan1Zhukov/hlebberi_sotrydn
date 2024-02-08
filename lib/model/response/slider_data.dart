class SalaryReport {
  final int total;
  final Map<String, int> report;
  final Map<String, WorkScheduleLabel> labels;

  SalaryReport({
    required this.total,
    required this.report,
    required this.labels,
  });

  factory SalaryReport.fromJson(Map<String, dynamic> json) {
    final total = json['total'];
    final reportJson = json['report'] as Map<String, dynamic>;
    final report = reportJson.map((key, value) => MapEntry(key, value as int));
    final labelsJson = json['labels'] as Map<String, dynamic>;
    final labels = labelsJson.map((key, value) =>
        MapEntry(key, WorkScheduleLabel.fromJson(value as Map<String, dynamic>)));
    return SalaryReport(
      total: total,
      report: report,
      labels: labels,
    );
  }
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
    final report = reportJson.map((key, value) => MapEntry(key, value as String));
    final labelsJson = json['labels'] as Map<String, dynamic>;
    final labels = labelsJson.map((key, value) =>
        MapEntry(key, WorkScheduleLabel.fromJson(value as Map<String, dynamic>)));
    return WorkSchedule(
      report: report,
      labels: labels,
    );
  }
}

class WorkScheduleLabel {
  final String name;
  final String color;
  final String? iconUrl;

  WorkScheduleLabel({
    required this.name,
    required this.color,
    this.iconUrl,
  });

  factory WorkScheduleLabel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final color = json['color'];
    final iconUrl = json['iconUrl'];
    return WorkScheduleLabel(
      name: name,
      color: color,
      iconUrl: iconUrl,
    );
  }
}

class SliderData {
  final SalaryReport salary;
  final WorkSchedule workSchedule;

  SliderData({
    required this.salary,
    required this.workSchedule,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) {
    final salary = SalaryReport.fromJson(json['salary']);
    final workSchedule = WorkSchedule.fromJson(json['work_schedule']);
    return SliderData(
      salary: salary,
      workSchedule: workSchedule,
    );
  }
}