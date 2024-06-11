import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/slider_data.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
import 'package:hlebberi_sotrydn/utils/parser.dart';

class DayDetail {
  final UserShift? userShift;
  final SalaryReport salary;

  DayDetail({
    required this.userShift,
    required this.salary,
  });

  static DayDetail? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final userShift = UserShift.fromJson(json['user_shift']);
    final salary = SalaryReport.fromJson(json['salary']);
    if (salary == null) return null;
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

  static UserShift? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final id = json.getIntOrNull('id');
    final start = json.getDateTimeOrNull('start');
    final end = json.getDateTimeOrNull('end');
    final location = json.getStringOrNull('location');
    final role = json.getStringOrNull('role');
    if (id == null || start == null || location == null || role == null) {
      return null;
    }
    return UserShift(
      id: id,
      start: start,
      end: end,
      location: location,
      role: role,
    );
  }

  String time(BuildContext context) {
    final startTime = start.hhmm();
    final end = this.end;
    final endTime = end != null ? end.hhmm() : "открыта";
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

  factory SalaryReport.fromSalary({
    required Salary salary,
    required List<Detail> detailList,
  }) {
    return SalaryReport(
      total: salary.total,
      report: salary.report,
      labels: salary.labels,
      detailList: detailList,
    );
  }

  static SalaryReport? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final salary = Salary.fromJson(json);
    final List<Detail> detailList = json.getList(
      key: 'detail_list',
      converter: (v) => Detail.fromJson(v)!,
    );
    if (salary == null) return null;
    return SalaryReport.fromSalary(
      salary: salary,
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

  static Detail? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final type = json.getStringOrNull('type');
    final comment = json.getStringOrNull('comment');
    final amount = json.getIntOrNull('amount');
    if (type == null || amount == null) return null;
    return Detail(
      type: type,
      comment: comment,
      amount: amount,
    );
  }
}
