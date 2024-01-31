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

  @override
  String toString() {
    return "LoginData($user, token=$token)";
  }
}

class User {
  final int id;
  final String name;
  final String surename;
  final String secondname;
  final DefaultRole? defaultRole;
  final String addressCode1C;
  final String? avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.surename,
    required this.secondname,
    required this.defaultRole,
    required this.addressCode1C,
    required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    final id = json['id'];
    final name = json['name'];
    final surename = json['surename'];
    final secondname = json['secondname'];
    final defaultRole = (json['default_role'] != null)
        ? DefaultRole.fromJson(json['default_role'])
        : null;
    final addressCode1C = json['point_location_code_1c'];
    final avatarUrl = json['avatar'];
    return User(
      id: id,
      name: name,
      surename: surename,
      secondname: secondname,
      defaultRole: defaultRole,
      addressCode1C: addressCode1C,
      avatarUrl: avatarUrl,
    );
  }

  @override
  String toString() => "User($name)";
}

class DefaultRole {
  final int id;
  final String name;

  DefaultRole({required this.id, required this.name});

  factory DefaultRole.fromJson(Map<String, dynamic> json) {
    return DefaultRole(
      id: json['id'],
      name: json['name'],
    );
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
}

class EmployeeExternalLink {
  final String name;
  final String url;

  EmployeeExternalLink({required this.name, required this.url});

  factory EmployeeExternalLink.fromJson(Map<String, dynamic> json) {
    return EmployeeExternalLink(
      name: json['name'],
      url: json['url'],
    );
  }
}

class EmployeeSocialLink {
  final String name;
  final String url;
  final String logo;

  EmployeeSocialLink(
      {required this.name, required this.url, required this.logo});

  factory EmployeeSocialLink.fromJson(Map<String, dynamic> json) {
    return EmployeeSocialLink(
      name: json['name'],
      url: json['url'],
      logo: json['logo'],
    );
  }
}
