import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/login_data.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
import 'package:hlebberi_sotrydn/utils/parser.dart';

class Smena {
  final UserShift? userShift;
  final ShiftWorkingTime? shiftWorkingTime;
  final List<User> users;

  Smena({
    required this.userShift,
    required this.shiftWorkingTime,
    required this.users,
  });

  static Smena? fromJson(final Map<String, dynamic>? json) {
    if (json == null) return null;
    final userShift = UserShift.fromJson(json['user_shift']);
    final shiftWorkingTime =
        ShiftWorkingTime.fromJson(json['shift_working_time']);
    final List<User> users = json.getList(
      key: 'users',
      converter: (v) => User.fromJson(v)!,
    );
    return Smena(
      userShift: userShift,
      shiftWorkingTime: shiftWorkingTime,
      users: users,
    );
  }

  String timePlan() => shiftWorkingTime?.getTimePlan() ?? "Нет данных";

  String timeFact(BuildContext context) =>
      userShift?.getTimeFact(context) ?? "Нет данных";
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

  static UserShift? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final id = json.getIntOrNull('id');
    final start = json.getDateTimeOrNull('start');
    final end = json.getDateTimeOrNull('end');
    if (id == null || start == null) return null;
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

  static ShiftWorkingTime? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final startingAt = json.getStringOrNull('starting_at');
    final finishingAt = json.getStringOrNull('finishing_at');
    if (startingAt == null || finishingAt == null) return null;
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

  static User? fromJson(final Map<String, dynamic>? json) {
    if (json == null) return null;
    final id = json.getIntOrNull('id');
    final fio = UserFio.fromJson(json);
    final avatar = json.getStringOrNull('avatar');
    if (id == null || fio == null) return null;
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
