import 'package:url_launcher/url_launcher.dart';

/// Открыть ссылку
Future<bool> openLink(String url) async {
  final call = Uri.parse(url);
  var canLaunch = await canLaunchUrl(call);
  if (canLaunch) {
    await launchUrl(
      call,
      mode: LaunchMode.externalApplication,
    );
    return true;
  }
  return false;
}

/// Открыть телефон
Future<bool> openPhone(String phone) async {
  String url = "tel:$phone";
  final call = Uri.parse(url);
  var canLaunch = await canLaunchUrl(call);
  if (canLaunch) {
    await launchUrl(
      call,
      mode: LaunchMode.externalApplication,
    );
    return true;
  }
  return false;
}

/// Открыть email
Future<bool> openEmail(String email) async {
  String url = "mailto:$email";
  final call = Uri.parse(url);
  var canLaunch = await canLaunchUrl(call);
  if (canLaunch) {
    await launchUrl(
      call,
      mode: LaunchMode.externalApplication,
    );
    return true;
  }
  return false;
}