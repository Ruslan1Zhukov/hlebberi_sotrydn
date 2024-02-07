class ShiftData {
  final UserShift userShift;
  final ShiftWorkingTime shiftWorkingTime;
  final List<User> users;

  ShiftData({
    required this.userShift,
    required this.shiftWorkingTime,
    required this.users,
  });

  factory ShiftData.fromJson(Map<String, dynamic> json) {
    return ShiftData(
      userShift: UserShift.fromJson(json['user_shift']),
      shiftWorkingTime: ShiftWorkingTime.fromJson(json['shift_working_time']),
      users: List<User>.from(json['users'].map((user) => User.fromJson(user))),
    );
  }
}

class UserShift {
  final int id;
  final String start;
  final String? end;

  UserShift({
    required this.id,
    required this.start,
    required this.end,
  });

  factory UserShift.fromJson(Map<String, dynamic> json) {
    return UserShift(
      id: json['id'],
      start: json['start'],
      end: json['end'],
    );
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
    return ShiftWorkingTime(
      startingAt: json['starting_at'],
      finishingAt: json['finishing_at'],
    );
  }
}

class User {
  final int id;
  final String name;
  final String surname;
  final String? secondname;
  final String? avatar;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.secondname,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      secondname: json['secondname'],
      avatar: json['avatar'],
    );
  }
}
