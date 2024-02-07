class MonthDetail {
  final int total;
  final Report report;
  final Map<String, ReportLabel> labels;
  final Map<String, dynamic> detailList;

  MonthDetail({
    required this.total,
    required this.report,
    required this.labels,
    required this.detailList,
  });

  factory MonthDetail.fromJson(Map<String, dynamic> json) {
    return MonthDetail(
      total: json['total_salary'],
      report: Report.fromJson(json['report']),
      labels: Map.from(json['report_labels']).map(
            (key, value) => MapEntry(key, ReportLabel.fromJson(value)),
      ),
      detailList: Map.from(json['report_detail_list']),
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

class ReportLabel {
  final String name;
  final String color;

  ReportLabel({required this.name, required this.color});

  factory ReportLabel.fromJson(Map<String, dynamic> json) {
    return ReportLabel(
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
