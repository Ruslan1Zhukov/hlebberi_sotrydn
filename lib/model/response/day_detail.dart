class DayDetail {
  final UserShift userShift;
  final Salary salary;
  final ReportLabels reportLabels;

  DayDetail({
    required this.userShift,
    required this.salary,
    required this.reportLabels,
  });

  factory DayDetail.fromJson(final Map<String, dynamic> json) {
    final userShift = UserShift.fromJson(json['user_shift']);
    final salary = Salary.fromJson(json['salary']);
    final reportLabels = ReportLabels.fromJson(json['report_labels']);
    return DayDetail(
      userShift: userShift,
      salary: salary,
      reportLabels: reportLabels,
    );
  }
}

class UserShift {
  final int id;
  final String start;
  final String? end;
  final Location location;
  final Role role;

  UserShift({
    required this.id,
    required this.start,
    required this.end,
    required this.location,
    required this.role,
  });

  factory UserShift.fromJson(final Map<String, dynamic> json) {
    final id = json['id'];
    final start = json['start'];
    final end = json['end'];
    final location = Location.fromJson(json['location']);
    final role = Role.fromJson(json['role']);
    return UserShift(
      id: id,
      start: start,
      end: end,
      location: location,
      role: role,
    );
  }

}

class Location {
  final String address;

  Location({
    required this.address,
  });

  factory Location.fromJson(final Map<String, dynamic> json) {
    final address = json['address'];
    return Location(
      address: address,
    );
  }

}

class Role {
  final String name;

  Role({
    required this.name,
  });

  factory Role.fromJson(final Map<String, dynamic> json) {
    final name = json['name'];
    return Role(
      name: name,
    );
  }

}

class Salary {
  final Penalty penalty;
  final Bonuses bonuses;

  Salary({
    required this.penalty,
    required this.bonuses,
  });

  factory Salary.fromJson(final Map<String, dynamic> json) {
    final penalty = Penalty.fromJson(json['penalty']);
    final bonuses = Bonuses.fromJson(json['bonuses']);
    return Salary(
      penalty: penalty,
      bonuses: bonuses,
    );
  }

}

class Penalty {
  final int penaltyDaily;

  Penalty({
    required this.penaltyDaily,
  });

  factory Penalty.fromJson(final Map<String, dynamic> json) {
    final penaltyDaily = json['penalty_daily'];
    return Penalty(
      penaltyDaily: penaltyDaily,
    );
  }

}

class Bonuses {
  final int bonusDaily;

  Bonuses({
    required this.bonusDaily,
  });

  factory Bonuses.fromJson(final Map<String, dynamic> json) {
    final bonusDaily = json['bonus_daily'];
    return Bonuses(
      bonusDaily: bonusDaily,
    );
  }

}

class ReportLabels {
  final ReportLabel salaryMonthly;
  final ReportLabel bonusMonthly;
  final ReportLabel bonusDaily;
  final ReportLabel salePercentageDaily;
  final ReportLabel penaltyMonthly;
  final ReportLabel penaltyDaily;

  ReportLabels({
    required this.salaryMonthly,
    required this.bonusMonthly,
    required this.bonusDaily,
    required this.salePercentageDaily,
    required this.penaltyMonthly,
    required this.penaltyDaily,
  });

  factory ReportLabels.fromJson(final Map<String, dynamic> json) {
    final salaryMonthly = ReportLabel.fromJson(json['salary_monthly']);
    final bonusMonthly = ReportLabel.fromJson(json['bonus_monthly']);
    final bonusDaily = ReportLabel.fromJson(json['bonus_daily']);
    final salePercentageDaily = ReportLabel.fromJson(json['sale_percentage_daily']);
    final penaltyMonthly = ReportLabel.fromJson(json['penalty_monthly']);
    final penaltyDaily = ReportLabel.fromJson(json['penalty_daily']);
    return ReportLabels(
      salaryMonthly: salaryMonthly,
      bonusMonthly: bonusMonthly,
      bonusDaily: bonusDaily,
      salePercentageDaily: salePercentageDaily,
      penaltyMonthly: penaltyMonthly,
      penaltyDaily: penaltyDaily,
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
