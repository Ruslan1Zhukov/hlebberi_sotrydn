import 'package:hlebberi_sotrydn/model/response/login_data.dart';

/// Состояние аккаунта
class Account {
  User? user;
  String? token;
  EmployeeAppSettings? employeeAppSettings;
  List<EmployeeExternalLink>? employeeExternalLinks;
  List<EmployeeSocialLink>? employeeSocialLinks;

  Account({
    this.user,
    this.token,
    this.employeeAppSettings,
    this.employeeExternalLinks,
    this.employeeSocialLinks,
  });

  bool get isAuth => token != null;
}
