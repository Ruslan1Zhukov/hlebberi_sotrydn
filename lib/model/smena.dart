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
  final String avatarUrl;
  final String fio;

  UserSmena({
    required this.avatarUrl,
    required this.fio,
  });
}
