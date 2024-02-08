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

class Label {
  final String name;
  final String color;
  final String? colored;

  Label({
    required this.name,
    required this.color,
    this.colored,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final color = json['color'];
    final colored = json['colored'];
    return Label(
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

class MonthDetail {
  final int total;
  final Report report;
  final Map<String, Label> labels;
  final List<Detail> detailList;

  MonthDetail({
    required this.total,
    required this.report,
    required this.labels,
    required this.detailList,
  });

  factory MonthDetail.fromJson(Map<String, dynamic> json) {
    final total = json['total'];
    final report = Report.fromJson(json['report']);
    final labelsJson = json['labels'] as Map<String, dynamic>;
    final labels = labelsJson.map((key, value) =>
        MapEntry(key, Label.fromJson(value as Map<String, dynamic>)));
    final detailListJson = json['detail_list'] as List<dynamic>;
    final detailList = detailListJson
        .map((detail) => Detail.fromJson(detail as Map<String, dynamic>))
        .toList();
    return MonthDetail(
      total: total,
      report: report,
      labels: labels,
      detailList: detailList,
    );
  }
}
