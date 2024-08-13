import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/utils/parser.dart';

class LoginData {
  final User user;
  final String token;
  final EmployeeAppSettings? employeeAppSettings;
  final List<EmployeeExternalLink> employeeExternalLinks;
  final List<EmployeeSocialLink> employeeSocialLinks;

  LoginData({
    required this.user,
    required this.token,
    required this.employeeAppSettings,
    required this.employeeExternalLinks,
    required this.employeeSocialLinks,
  });

  static LoginData? fromJson(
    Map<String, dynamic>? json, [
    bool isTokenFromStore = false,
  ]) {
    if (json == null) return null;
    final user = User.fromJson(json['user']);
    final token = isTokenFromStore
        ? store.state.account.token
        : json.getStringOrNull("token");
    final employeeAppSettings =
        EmployeeAppSettings.fromJson(json['employee_app_settings']);
    final List<EmployeeExternalLink> employeeExternalLinks = json.getList(
      key: 'employee_external_links',
      converter: (item) => EmployeeExternalLink.fromJson(item)!,
    );
    final List<EmployeeSocialLink> employeeSocialLinks = json.getList(
      key: 'employee_social_links',
      converter: (item) => EmployeeSocialLink.fromJson(item)!,
    );
    if (user == null || token == null) return null;
    return LoginData(
      user: user,
      token: token,
      employeeAppSettings: employeeAppSettings,
      employeeExternalLinks: employeeExternalLinks,
      employeeSocialLinks: employeeSocialLinks,
    );
  }

  LoginData copyWith({
    String? avatarUrl,
  }) {
    return LoginData(
      user: User(
        id: user.id,
        fio: user.fio,
        defaultRole: user.defaultRole,
        avatarUrl: avatarUrl,
        location: user.location,
      ),
      token: token,
      employeeAppSettings: employeeAppSettings,
      employeeExternalLinks: employeeExternalLinks,
      employeeSocialLinks: employeeSocialLinks,
    );
  }

  Map<String, dynamic> toJson() {
    final employeeAppSettings = this.employeeAppSettings;
    return {
      'user': user.toJson(),
      'token': token,
      if (employeeAppSettings != null)
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
  final String? avatarUrl;
  final String? location;

  User({
    required this.id,
    required this.fio,
    required this.defaultRole,
    required this.avatarUrl,
    required this.location,
  });

  static User? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final id = json.getIntOrNull('id');
    final fio = UserFio.fromJson(json);
    final defaultRole = DefaultRole.fromJson(json['default_role']);
    final avatarUrl = json.getStringOrNull('avatar');
    final location = json['setting']?['location']?.getStringOrNull('address');
    if (id == null || fio == null) return null;
    return User(
      id: id,
      fio: fio,
      defaultRole: defaultRole,
      avatarUrl: avatarUrl,
      location: location,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': fio.firstName,
      'secondname': fio.patronymic,
      'default_role': defaultRole?.toJson(),
      'avatar': avatarUrl,
    };
  }

  @override
  String toString() => "User($fio)";

  String get jobTitle => defaultRole?.name ?? 'ХЗ';
}

class UserFio {
  final String firstName;
  final String? patronymic;

  UserFio({
    required this.firstName,
    this.patronymic,
  });

  static UserFio? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final name = json.getStringOrNull('name') ?? "";
    final secondname = json.getStringOrNull('secondname');
    return UserFio(
      firstName: name,
      patronymic: secondname,
    );
  }

  UserFio.empty()
      : firstName = "--------",
        patronymic = null;

  @override
  String toString() => fullFio();

  String fullFio() {
    return firstName;
  }

  String fullFio2() {
    return firstName;
  }

  /// Получить инициалы имени и фамилии
  String initials() {
    var firstLetter = (firstName.isNotEmpty) ? firstName[0] : "-";
    return firstLetter;
  }
}

class DefaultRole {
  final int id;
  final String name;

  DefaultRole({
    required this.id,
    required this.name,
  });

  static DefaultRole? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final id = json.getIntOrNull('id');
    final name = json.getStringOrNull('name');
    if (id == null || name == null) return null;
    return DefaultRole(
      id: id,
      name: name,
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

  static EmployeeAppSettings? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final maxFileSize = json.getIntOrNull('max_file_size');
    if (maxFileSize == null) return null;
    return EmployeeAppSettings(
      maxFileSize: maxFileSize,
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
  final bool openInBrowser;

  EmployeeExternalLink({
    required this.name,
    required this.url,
    required this.openInBrowser,
  });

  static EmployeeExternalLink? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final name = json.getStringOrNull('name');
    final url = json.getStringOrNull('url');
    final openInBrowser = json.getBoolOrNull('open_in_browser') ?? false;
    if (name == null || url == null) return null;
    return EmployeeExternalLink(
      name: name,
      url: url,
      openInBrowser: openInBrowser,
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

  static EmployeeSocialLink? fromJson(Map<String, dynamic>? json) {
    if (json == null) return null;
    final name = json.getStringOrNull('name') ?? "";
    final url = json.getStringOrNull('url');
    final logoUrl = json.getStringOrNull('logo');
    if (url == null || logoUrl == null) return null;
    return EmployeeSocialLink(
      name: name,
      url: url,
      logoUrl: logoUrl,
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
