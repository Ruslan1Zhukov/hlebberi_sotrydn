class DayDetail {
  final UserShift userShift;
  final SalaryReport salary;

  DayDetail({
    required this.userShift,
    required this.salary,
  });

  factory DayDetail.fromJson(Map<String, dynamic> json) {
    final userShift = UserShift.fromJson(json['user_shift']);
    final salary = SalaryReport.fromJson(json['salary']);
    return DayDetail(
      userShift: userShift,
      salary: salary,
    );
  }
}

class UserShift {
  final int id;
  final DateTime start;
  final DateTime? end;
  final String location;
  final String role;

  UserShift({
    required this.id,
    required this.start,
    this.end,
    required this.location,
    required this.role,
  });

  factory UserShift.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final start = DateTime.parse(json['start']);
    final end = json['end'] != null ? DateTime.parse(json['end']) : null;
    final location = json['location'];
    final role = json['role'];
    return UserShift(
      id: id,
      start: start,
      end: end,
      location: location,
      role: role,
    );
  }
}

class SalaryReport {
  final int total;
  final Map<String, int> report;
  final Map<String, WorkScheduleLabel> labels;
  final List<Detail> detailList;

  SalaryReport({
    required this.total,
    required this.report,
    required this.labels,
    required this.detailList,
  });

  factory SalaryReport.fromJson(Map<String, dynamic> json) {
    final total = json['total'];
    final reportJson = json['report'] as Map<String, dynamic>;
    final report = reportJson.map((key, value) => MapEntry(key, value as int));
    final labelsJson = json['labels'] as Map<String, dynamic>;
    final labels = labelsJson.map((key, value) =>
        MapEntry(key, WorkScheduleLabel.fromJson(value as Map<String, dynamic>)));
    final detailListJson = json['detail_list'] as List<dynamic>;
    final detailList = detailListJson
        .map((detail) => Detail.fromJson(detail as Map<String, dynamic>))
        .toList();
    return SalaryReport(
      total: total,
      report: report,
      labels: labels,
      detailList: detailList,
    );
  }
}

class WorkScheduleLabel {
  final String name;
  final String color;
  final String? colored;

  WorkScheduleLabel({
    required this.name,
    required this.color,
    this.colored,
  });

  factory WorkScheduleLabel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final color = json['color'];
    final colored = json['colored'];
    return WorkScheduleLabel(
      name: name,
      color: color,
      colored: colored,
    );
  }
}

class Detail {
  final String type;
  final String? comment;
  final int amount;

  Detail({
    required this.type,
    required this.comment,
    required this.amount,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    final type = json['type'];
    final comment = json['comment'];
    final amount = json['amount'];
    return Detail(
      type: type,
      comment: comment,
      amount: amount,
    );
  }
}