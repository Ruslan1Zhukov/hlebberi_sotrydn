// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hlebberi_sotrydn/model/login_data.dart';
import 'package:hlebberi_sotrydn/pages/webView.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/theme/divider.dart';
import 'package:hlebberi_sotrydn/theme/list_tile.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';
import 'package:hlebberi_sotrydn/widgets/back.dart';
import 'package:hlebberi_sotrydn/widgets/change_image.dart';
import 'package:hlebberi_sotrydn/widgets/header.dart';
import 'package:hlebberi_sotrydn/widgets/logout.dart';
import 'package:hlebberi_sotrydn/widgets/socials.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  _openExternalLink(EmployeeExternalLink link, BuildContext context) {
    if (link.openInBrowser) return _openInBrowser(link, context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPage(url: link.url),
      ),
    );
  }

  void _openInBrowser(EmployeeExternalLink link, BuildContext context) async {
    final uri = Uri.parse(link.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Невозможно открыть ссылку"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldProject(
      isQRScan: true,
      child: StoreConnector<AppState, List<EmployeeExternalLink>>(
          converter: (store) => store.state.account.employeeExternalLinks ?? [],
          builder: (context, links) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const BackWidget(title: "Информация"),
                    const SizedBox(height: 32),
                    const HeaderWidget(isNeedSettings: false),
                    const SizedBox(height: 24),
                    const DividerProject(),
                    const ChangeImageButton(),
                    const DividerProject(),
                     const SizedBox(height: 14),
                     const InfoButton(),
                    const SizedBox(height: 7),
                    const DividerProject(),
                    const SizedBox(height: 40),
                    const DividerProject(),
                    for (final link in links) ...[
                      ListTileProject(
                        title: link.name,
                        onTap: () => _openExternalLink(link, context),
                      ),
                      const DividerProject(),
                    ],
                    const SizedBox(height: 20),
                    const SocialsWidget(),
                    const SizedBox(height: 26),
                    const LogoutWidget(),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
