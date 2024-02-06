class Report {
  final int prepaymentMonthly;
  final int bonusMonthly;
  final int bonusDaily;
  final int salaryMonthly;
  final int penaltyMonthly;

  Report({
    required this.prepaymentMonthly,
    required this.bonusMonthly,
    required this.bonusDaily,
    required this.salaryMonthly,
    required this.penaltyMonthly,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    final report = json['report'];
    return Report(
      prepaymentMonthly: report['prepayment_monthly'],
      bonusMonthly: report['bonus_monthly'],
      bonusDaily: report['bonus_daily'],
      salaryMonthly: report['salary_monthly'],
      penaltyMonthly: report['penalty_monthly'],
    );
  }
}

class ReportLabel {
  final String name;
  final String color;

  ReportLabel({
    required this.name,
    required this.color,
  });

  factory ReportLabel.fromJson(Map<String, dynamic> json) {
    return ReportLabel(
      name: json['name'],
      color: json['color'],
    );
  }
}

class WorkSchedules {
  final Map<String, String> workSchedules;
  final List<String> shiftUserExistDates;
  final List<String> vacationDates;
  final List<String> sickLeaveDates;

  WorkSchedules({
    required this.workSchedules,
    required this.shiftUserExistDates,
    required this.vacationDates,
    required this.sickLeaveDates,
  });

  factory WorkSchedules.fromJson(Map<String, dynamic> json) {
    final schedules = json['work_schedules'];
    return WorkSchedules(
      workSchedules: Map<String, String>.from(schedules['work_schedules']),
      shiftUserExistDates: List<String>.from(schedules['shift_user_exist_dates']),
      vacationDates: List<String>.from(schedules['vacation_dates']),
      sickLeaveDates: List<String>.from(schedules['sick_leave_dates']),
    );
  }
}

class WorkScheduleLabel {
  final String name;
  final String color;

  WorkScheduleLabel({
    required this.name,
    required this.color,
  });

  factory WorkScheduleLabel.fromJson(Map<String, dynamic> json) {
    return WorkScheduleLabel(
      name: json['name'],
      color: json['color'],
    );
  }
}

class Data {
  final int totalSalary;
  final Report report;
  final Map<String, ReportLabel> reportLabels;
  final WorkSchedules workSchedules;
  final Map<String, WorkScheduleLabel> workScheduleLabels;

  Data({
    required this.totalSalary,
    required this.report,
    required this.reportLabels,
    required this.workSchedules,
    required this.workScheduleLabels,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return Data(
      totalSalary: data['total_salary'],
      report: Report.fromJson(data['report']),
      reportLabels: Map.from(data['report_labels']).map(
            (key, value) => MapEntry(key, ReportLabel.fromJson(value)),
      ),
      workSchedules: WorkSchedules.fromJson(data['work_schedules']),
      workScheduleLabels: Map.from(data['work_schedule_labels']).map(
            (key, value) => MapEntry(key, WorkScheduleLabel.fromJson(value)),
      ),
    );
  }
}

class MyJsonData {
  final bool status;
  final Data data;

  MyJsonData({
    required this.status,
    required this.data,
  });

  factory MyJsonData.fromJson(Map<String, dynamic> json) {
    return MyJsonData(
      status: json['status'],
      data: Data.fromJson(json),
    );
  }
}
