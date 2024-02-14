import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/slider_data.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';

class DayDetail {
  final UserShift? userShift;
  final SalaryReport salary;

  DayDetail({
    required this.userShift,
    required this.salary,
  });

  factory DayDetail.fromJson(Map<String, dynamic> json) {
    final userShift = json['user_shift'] != null
        ? UserShift.fromJson(json['user_shift'])
        : null;
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

  String time(BuildContext context) {
    final startTime = start.hhmm(context);
    final end = this.end;
    final endTime = end != null ? end.hhmm(context) : "открыта";
    return "$startTime-$endTime";
  }
}

class SalaryReport extends Salary {
  final List<Detail> detailList;

  SalaryReport({
    required super.total,
    required super.report,
    required super.labels,
    required this.detailList,
  });

  factory SalaryReport.fromJson(Map<String, dynamic> json) {
    final total = json['total'];
    final reportJson = json['report'];
    Map<String, int> report;
    if (reportJson == null) {
      report = {};
    } else if (reportJson is Map<String, dynamic>) {
      report = reportJson.map((key, value) => MapEntry(key, value as int));
    } else {
      report = {};
    }
    final labelsJson = json['labels'];
    Map<String, SalaryLabel> labels;
    if (labelsJson == null) {
      labels = {};
    } else if (labelsJson is Map<String, dynamic>) {
      labels = labelsJson.map((key, value) =>
          MapEntry(key, SalaryLabel.fromJson(value as Map<String, dynamic>)));
    } else {
      labels = {};
    }
    final detailListJson = json['detail_list'] as List<dynamic>?;
    List<Detail> detailList = (detailListJson != null)
        ? detailListJson
            .map((detail) => Detail.fromJson(detail))
            .toList()
        : [];
    return SalaryReport(
      total: total,
      report: report,
      labels: labels,
      detailList: detailList,
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
