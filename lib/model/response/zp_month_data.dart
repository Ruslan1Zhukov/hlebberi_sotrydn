class ReportLabels {
  final String name;
  final String color;

  ReportLabels({required this.name, required this.color});

  factory ReportLabels.fromJson(Map<String, dynamic> json) {
    return ReportLabels(
      name: json['name'],
      color: json['color'],
    );
  }
}

class ReportDetailList {
  final String name;
  final String color;
  final String comment;
  final int amount;

  ReportDetailList({
    required this.name,
    required this.color,
    required this.comment,
    required this.amount,
  });

  factory ReportDetailList.fromJson(Map<String, dynamic> json) {
    return ReportDetailList(
      name: json['name'],
      color: json['color'],
      comment: json['comment'],
      amount: json['amount'],
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

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      prepaymentMonthly: json['prepayment_monthly'],
      bonusMonthly: json['bonus_monthly'],
      bonusDaily: json['bonus_daily'],
      salaryMonthly: json['salary_monthly'],
      penaltyMonthly: json['penalty_monthly'],
    );
  }
}

class Data {
  final int totalSalary;
  final Report report;
  final Map<String, ReportLabels> reportLabels;
  final Map<String, dynamic> reportDetailList;

  Data({
    required this.totalSalary,
    required this.report,
    required this.reportLabels,
    required this.reportDetailList,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      totalSalary: json['total_salary'],
      report: Report.fromJson(json['report']),
      reportLabels: Map.from(json['report_labels']).map(
            (key, value) => MapEntry(key, ReportLabels.fromJson(value)),
      ),
      reportDetailList: Map.from(json['report_detail_list']),
    );
  }
}

class MyResponse {
  final bool status;
  final Data data;

  MyResponse({
    required this.status,
    required this.data,
  });

  factory MyResponse.fromJson(Map<String, dynamic> json) {
    return MyResponse(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}
