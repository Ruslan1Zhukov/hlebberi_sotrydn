class SliderData {
  final int total;
  final Report report;
  final Map<String, ReportLabel> reportLabels;
  final WorkSchedules workSchedules;
  final Map<String, WorkScheduleLabel> workScheduleLabels;

  SliderData({
    required this.total,
    required this.report,
    required this.reportLabels,
    required this.workSchedules,
    required this.workScheduleLabels,
  });

  factory SliderData.fromJson(final Map<String, dynamic> json) {
    final data = json['data'];
    final total = data['total_salary'];
    final report = Report.fromJson(data['report']);
    final reportLabels = Map<String, ReportLabel>.from(data['report_labels']).map(
          (key, value) => MapEntry(key, ReportLabel.fromJson(value as Map<String, dynamic>)),
    );
    final workSchedules = WorkSchedules.fromJson(data['work_schedules']);
    final workScheduleLabels = Map<String, WorkScheduleLabel>.from(data['work_schedule_labels']).map(
          (key, value) => MapEntry(key, WorkScheduleLabel.fromJson(value as Map<String, dynamic>)),
    );
    return SliderData(
      total: total,
      report: report,
      reportLabels: reportLabels,
      workSchedules: workSchedules,
      workScheduleLabels: workScheduleLabels,
    );
  }

}

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

  factory Report.fromJson(final Map<String, dynamic> json) {
    final report = json['report'];
    final prepaymentMonthly = report['prepayment_monthly'];
    final bonusMonthly = report['bonus_monthly'];
    final bonusDaily = report['bonus_daily'];
    final salaryMonthly = report['salary_monthly'];
    final penaltyMonthly = report['penalty_monthly'];
    return Report(
      prepaymentMonthly: prepaymentMonthly,
      bonusMonthly: bonusMonthly,
      bonusDaily: bonusDaily,
      salaryMonthly: salaryMonthly,
      penaltyMonthly: penaltyMonthly,
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

  factory ReportLabel.fromJson(final Map<String, dynamic> json) {
    final name = json['name'];
    final color = json['color'];
    return ReportLabel(
      name: name,
      color: color,
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

  factory WorkSchedules.fromJson(final Map<String, dynamic> json) {
    final schedules = json['work_schedules'];
    final workSchedules = Map<String, String>.from(schedules['work_schedules']);
    final shiftUserExistDates = List<String>.from(schedules['shift_user_exist_dates']);
    final vacationDates = List<String>.from(schedules['vacation_dates']);
    final sickLeaveDates = List<String>.from(schedules['sick_leave_dates']);
    return WorkSchedules(
      workSchedules: workSchedules,
      shiftUserExistDates: shiftUserExistDates,
      vacationDates: vacationDates,
      sickLeaveDates: sickLeaveDates,
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

  factory WorkScheduleLabel.fromJson(final Map<String, dynamic> json) {
    final name = json['name'];
    final color = json['color'];
    return WorkScheduleLabel(
      name: name,
      color: color,
    );
  }

}
