import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/response/login_data.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';

class Smena {
  final UserShift userShift;
  final ShiftWorkingTime shiftWorkingTime;
  final List<User> users;

  Smena({
    required this.userShift,
    required this.shiftWorkingTime,
    required this.users,
  });

  factory Smena.fromJson(final Map<String, dynamic> json) {
    final userShift = UserShift.fromJson(json['user_shift']);
    final shiftWorkingTime =
        ShiftWorkingTime.fromJson(json['shift_working_time']);
    final users =
        List<User>.from(json['users'].map((user) => User.fromJson(user)));
    return Smena(
      userShift: userShift,
      shiftWorkingTime: shiftWorkingTime,
      users: users,
    );
  }

  String timePlan() => shiftWorkingTime.getTimePlan();

  String timeFact(BuildContext context) => userShift.getTimeFact(context);
}

class UserShift {
  final int id;
  final DateTime start;
  final DateTime? end;

  UserShift({
    required this.id,
    required this.start,
    this.end,
  });

  factory UserShift.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final start = DateTime.parse(json['start']);
    final end = json['end'] != null ? DateTime.parse(json['end']) : null;
    return UserShift(
      id: id,
      start: start,
      end: end,
    );
  }

  String getTimeFact(BuildContext context) {
    final dateStart = start.hhmm(context);
    final dateEnd = end?.hhmm(context) ?? "открыта";
    return "$dateStart-$dateEnd";
  }
}

class ShiftWorkingTime {
  final String startingAt;
  final String finishingAt;

  ShiftWorkingTime({
    required this.startingAt,
    required this.finishingAt,
  });

  factory ShiftWorkingTime.fromJson(Map<String, dynamic> json) {
    final startingAt = json['starting_at'];
    final finishingAt = json['finishing_at'];
    return ShiftWorkingTime(
      startingAt: startingAt,
      finishingAt: finishingAt,
    );
  }

  String getTimePlan() => "$startingAt-$finishingAt";
}

class User {
  final int id;
  final UserFio fio;
  final String? avatar;

  User({
    required this.id,
    required this.fio,
    required this.avatar,
  });

  factory User.fromJson(final Map<String, dynamic> json) {
    final id = json['id'];
    final fio = UserFio.fromJson(json);
    final avatar = json['avatar'];
    return User(
      id: id,
      fio: fio,
      avatar: avatar,
    );
  }

  User.empty()
      : id = 0,
        fio = UserFio.empty(),
        avatar = null;
}
