import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hlebberi_sotrydn/helpers/url.dart';
import 'package:hlebberi_sotrydn/model/login_data.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';

class SocialsWidget extends StatelessWidget {
  const SocialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<EmployeeSocialLink>>(
      converter: (store) => store.state.account.employeeSocialLinks ?? [],
      builder: (context, links) {
        return Wrap(
          children: [
            for (final link in links)
              IconButton(
                iconSize: 40,
                icon: SvgPicture.network(
                  link.logoUrl,
                  width: 40,
                  height: 40,
                ),
                onPressed: () {
                  openLink(link.url);
                },
              ),
          ],
        );
      },
    );
  }
}
