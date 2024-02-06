class UserShift {
  final int id;
  final String start;
  final String end;
  final Location location;
  final Role role;

  UserShift({
    required this.id,
    required this.start,
    required this.end,
    required this.location,
    required this.role,
  });

  factory UserShift.fromJson(Map<String, dynamic> json) {
    return UserShift(
      id: json['id'],
      start: json['start'],
      end: json['end'],
      location: Location.fromJson(json['location']),
      role: Role.fromJson(json['role']),
    );
  }
}

class Location {
  final String address;

  Location({
    required this.address,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      address: json['address'],
    );
  }
}

class Role {
  final String name;

  Role({
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      name: json['name'],
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

  factory Salary.fromJson(Map<String, dynamic> json) {
    return Salary(
      penalty: Penalty.fromJson(json['penalty']),
      bonuses: Bonuses.fromJson(json['bonuses']),
    );
  }
}

class Penalty {
  final int penaltyDaily;

  Penalty({
    required this.penaltyDaily,
  });

  factory Penalty.fromJson(Map<String, dynamic> json) {
    return Penalty(
      penaltyDaily: json['penalty_daily'],
    );
  }
}

class Bonuses {
  final int bonusDaily;

  Bonuses({
    required this.bonusDaily,
  });

  factory Bonuses.fromJson(Map<String, dynamic> json) {
    return Bonuses(
      bonusDaily: json['bonus_daily'],
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

  factory ReportLabels.fromJson(Map<String, dynamic> json) {
    return ReportLabels(
      salaryMonthly: ReportLabel.fromJson(json['salary_monthly']),
      bonusMonthly: ReportLabel.fromJson(json['bonus_monthly']),
      bonusDaily: ReportLabel.fromJson(json['bonus_daily']),
      salePercentageDaily: ReportLabel.fromJson(json['sale_percentage_daily']),
      penaltyMonthly: ReportLabel.fromJson(json['penalty_monthly']),
      penaltyDaily: ReportLabel.fromJson(json['penalty_daily']),
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

class Data {
  final UserShift userShift;
  final Salary salary;
  final ReportLabels reportLabels;

  Data({
    required this.userShift,
    required this.salary,
    required this.reportLabels,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userShift: UserShift.fromJson(json['user_shift']),
      salary: Salary.fromJson(json['salary']),
      reportLabels: ReportLabels.fromJson(json['report_labels']),
    );
  }
}

class Example {
  final bool status;
  final Data data;

  Example({
    required this.status,
    required this.data,
  });

  factory Example.fromJson(Map<String, dynamic> json) {
    return Example(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}
