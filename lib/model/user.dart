class User {
  final int id;
  final UserFio fio;
  final String jobTitle;
  final String? avatarUrl;
  final String location;

  User({
    required this.id,
    required this.fio,
    required this.jobTitle,
    required this.avatarUrl,
    required this.location,
  });
}

class UserFio {
  final String firstName;
  final String secondName;
  final String? patronymic;

  UserFio({
    required this.firstName,
    required this.secondName,
    this.patronymic,
  });

  String fullFio() {
    return "$firstName $secondName";
  }

  String fullFio2() {
    return "$firstName\n$secondName";
  }

  /// Получить инициалы имени и фамилии
  String initials() {
    var firstLetter = (firstName.isNotEmpty) ? firstName[0] : "-";
    var secondLetter = (secondName.isNotEmpty) ? secondName[0] : "-";
    return "$firstLetter$secondLetter";
  }
}
