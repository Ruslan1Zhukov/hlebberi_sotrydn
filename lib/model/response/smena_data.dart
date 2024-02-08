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
}

class ShiftData {
  final int id;
  final String name;
  final String surname;
  final String secondname;
  final String avatar;

  ShiftData({
    required this.id,
    required this.name,
    required this.surname,
    required this.secondname,
    required this.avatar,
  });

  factory ShiftData.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final surname = json['surname'];
    final secondname = json['secondname'];
    final avatar = json['avatar'];
    return ShiftData(
      id: id,
      name: name,
      surname: surname,
      secondname: secondname,
      avatar: avatar,
    );
  }
}
