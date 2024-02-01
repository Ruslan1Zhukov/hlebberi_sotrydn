class LoginData {
  final User user;
  final String token;
  final EmployeeAppSettings employeeAppSettings;
  final List<EmployeeExternalLink> employeeExternalLinks;
  final List<EmployeeSocialLink> employeeSocialLinks;

  LoginData({
    required this.user,
    required this.token,
    required this.employeeAppSettings,
    required this.employeeExternalLinks,
    required this.employeeSocialLinks,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    final user = User.fromJson(json['user']);
    final token = json['token'];
    final employeeAppSettings =
        EmployeeAppSettings.fromJson(json['employee_app_settings']);
    final employeeExternalLinks = (json['employee_external_links'] as List)
        .map((link) => EmployeeExternalLink.fromJson(link))
        .toList();
    final employeeSocialLinks = (json['employee_social_links'] as List)
        .map((link) => EmployeeSocialLink.fromJson(link))
        .toList();
    return LoginData(
      user: user,
      token: token,
      employeeAppSettings: employeeAppSettings,
      employeeExternalLinks: employeeExternalLinks,
      employeeSocialLinks: employeeSocialLinks,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'token': token,
      'employee_app_settings': employeeAppSettings.toJson(),
      'employee_external_links':
          employeeExternalLinks.map((link) => link.toJson()).toList(),
      'employee_social_links':
          employeeSocialLinks.map((link) => link.toJson()).toList(),
    };
  }

  @override
  String toString() {
    return "LoginData($user, token=$token)";
  }
}

class User {
  final int id;
  final UserFio fio;
  final DefaultRole? defaultRole;
  final String addressCode1C;
  final String? avatarUrl;

  User({
    required this.id,
    required this.fio,
    required this.defaultRole,
    required this.addressCode1C,
    required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final fio = UserFio.fromJson(json);
    final defaultRole = (json['default_role'] != null)
        ? DefaultRole.fromJson(json['default_role'])
        : null;
    final addressCode1C = json['point_location_code_1c'];
    final avatarUrl = json['avatar'];
    return User(
      id: id,
      fio: fio,
      defaultRole: defaultRole,
      addressCode1C: addressCode1C,
      avatarUrl: avatarUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': fio.firstName,
      'surename': fio.secondName,
      'secondname': fio.patronymic,
      'default_role': defaultRole?.toJson(),
      'point_location_code_1c': addressCode1C,
      'avatar': avatarUrl,
    };
  }

  @override
  String toString() => "User($fio)";

  String get location => "ХЗ";

  String get jobTitle => defaultRole?.name ?? 'ХЗ';
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

  factory UserFio.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final surename = json['surename'];
    final secondname = json['secondname'];
    return UserFio(
      firstName: name,
      secondName: surename,
      patronymic: secondname,
    );
  }

  @override
  String toString() => fullFio();

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

class DefaultRole {
  final int id;
  final String name;

  DefaultRole({
    required this.id,
    required this.name,
  });

  factory DefaultRole.fromJson(Map<String, dynamic> json) {
    return DefaultRole(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class EmployeeAppSettings {
  final int maxFileSize;

  EmployeeAppSettings({required this.maxFileSize});

  factory EmployeeAppSettings.fromJson(Map<String, dynamic> json) {
    return EmployeeAppSettings(
      maxFileSize: json['max_file_size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'max_file_size': maxFileSize,
    };
  }
}

class EmployeeExternalLink {
  final String name;
  final String url;

  EmployeeExternalLink({
    required this.name,
    required this.url,
  });

  factory EmployeeExternalLink.fromJson(Map<String, dynamic> json) {
    return EmployeeExternalLink(
      name: json['name'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}

class EmployeeSocialLink {
  final String name;
  final String url;
  final String logoUrl;

  EmployeeSocialLink({
    required this.name,
    required this.url,
    required this.logoUrl,
  });

  factory EmployeeSocialLink.fromJson(Map<String, dynamic> json) {
    return EmployeeSocialLink(
      name: json['name'],
      url: json['url'],
      logoUrl: json['logo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
      'logo': logoUrl,
    };
  }
}
