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

  factory MonthDetail.fromJson(final Map<String, dynamic> json) {
    final total = json['total_salary'];
    final report = Report.fromJson(json['report']);
    final labels = Map<String, ReportLabel>.from(json['report_labels']).map(
          (key, value) => MapEntry(key, ReportLabel.fromJson(value as Map<String, dynamic>)),
    );
    final detailList = Map<String, dynamic>.from(json['report_detail_list']);
    return MonthDetail(
      total: total,
      report: report,
      labels: labels,
      detailList: detailList,
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
    final prepaymentMonthly = json['prepayment_monthly'];
    final bonusMonthly = json['bonus_monthly'];
    final bonusDaily = json['bonus_daily'];
    final salaryMonthly = json['salary_monthly'];
    final penaltyMonthly = json['penalty_monthly'];
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

  ReportLabel({required this.name, required this.color});

  factory ReportLabel.fromJson(final Map<String, dynamic> json) {
    final name = json['name'];
    final color = json['color'];
    return ReportLabel(
      name: name,
      color: color,
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

  factory ReportDetailList.fromJson(final Map<String, dynamic> json) {
    final name = json['name'];
    final color = json['color'];
    final comment = json['comment'];
    final amount = json['amount'];
    return ReportDetailList(
      name: name,
      color: color,
      comment: comment,
      amount: amount,
    );
  }

}
