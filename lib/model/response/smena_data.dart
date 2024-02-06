class SmenaData {
  final int id;
  final String start;
  final String end;

  SmenaData({
    required this.id,
    required this.start,
    required this.end,
  });

  factory SmenaData.fromJson(Map<String, dynamic> json) {
    return SmenaData(
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
  final String secondname;
  final String avatar;

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

class Data {
  final SmenaData userShift;
  final ShiftWorkingTime shiftWorkingTime;
  final List<User> users;

  Data({
    required this.userShift,
    required this.shiftWorkingTime,
    required this.users,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userShift: SmenaData.fromJson(json['user_shift']),
      shiftWorkingTime: ShiftWorkingTime.fromJson(json['shift_working_time']),
      users: List<User>.from(json['users'].map((user) => User.fromJson(user))),
    );
  }
}

class Response {
  final bool status;
  final Data data;

  Response({
    required this.status,
    required this.data,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      status: json['status'],
      data: Data.fromJson(json['data']),
    );
  }
}

