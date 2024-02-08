class ShiftData {
  final UserShift userShift;
  final ShiftWorkingTime shiftWorkingTime;
  final List<User> users;

  ShiftData({
    required this.userShift,
    required this.shiftWorkingTime,
    required this.users,
  });

  factory ShiftData.fromJson(final Map<String, dynamic> json) {
    final userShift = UserShift.fromJson(json['user_shift']);
    final shiftWorkingTime = ShiftWorkingTime.fromJson(json['shift_working_time']);
    final users = List<User>.from(json['users'].map((user) => User.fromJson(user)));
    return ShiftData(
      userShift: userShift,
      shiftWorkingTime: shiftWorkingTime,
      users: users,
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

  factory UserShift.fromJson(final Map<String, dynamic> json) {
    final id = json['id'];
    final start = json['start'];
    final end = json['end'];
    return UserShift(
      id: id,
      start: start,
      end: end,
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

  factory ShiftWorkingTime.fromJson(final Map<String, dynamic> json) {
    final startingAt = json['starting_at'];
    final finishingAt = json['finishing_at'];
    return ShiftWorkingTime(
      startingAt: startingAt,
      finishingAt: finishingAt,
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

  factory User.fromJson(final Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final surname = json['surname'];
    final secondname = json['secondname'];
    final avatar = json['avatar'];
    return User(
      id: id,
      name: name,
      surname: surname,
      secondname: secondname,
      avatar: avatar,
    );
  }

}
