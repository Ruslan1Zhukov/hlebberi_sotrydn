import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hlebberi_sotrydn/model/login_data.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/theme/divider.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/theme/list_tile.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';
import 'package:hlebberi_sotrydn/widgets/back.dart';
import 'package:hlebberi_sotrydn/widgets/change_image.dart';
import 'package:hlebberi_sotrydn/widgets/header.dart';
import 'package:hlebberi_sotrydn/widgets/logout.dart';
import 'package:hlebberi_sotrydn/widgets/socials.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
                  const SizedBox(height: 40),
                  const DividerProject(),
                  for (final link in links) ...[
                    ListTileProject(
                      title: link.name,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebViewPage(url: link.url),
                          ),
                        );
                      },
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
        }
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;
  const WebViewPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorProject.orange,
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebResourceError: (error) {
        },
      ),

    );
  }
}


