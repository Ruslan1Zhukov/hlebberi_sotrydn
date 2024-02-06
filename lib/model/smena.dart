import 'package:hlebberi_sotrydn/model/response/login_data.dart';

class Smena {
  final String timePlan;
  final String timeFact;
  final List<UserSmena> users;

  Smena({
    required this.timePlan,
    required this.timeFact,
    required this.users,
  });

}

class UserSmena {
  final String? avatarUrl;
  final UserFio fio;

  UserSmena({
    required this.avatarUrl,
    required this.fio,
  });
}
