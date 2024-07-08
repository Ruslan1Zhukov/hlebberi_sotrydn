import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hlebberi_sotrydn/model/login_data.dart';
import 'package:hlebberi_sotrydn/pages/settings.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/utils/skeleton.dart';
import 'package:hlebberi_sotrydn/widgets/avatar.dart';
import 'package:hlebberi_sotrydn/widgets/location.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
    required this.isNeedSettings,
  });

  final bool isNeedSettings;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, User?>(
      converter: (store) => store.state.account.user,
      builder: (BuildContext context, User? user) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AvatarWidget(
                  isLoading: user == null,
                  avatarUrl: user?.avatarUrl,
                  fio: user?.fio,
                ),
                const SizedBox(width: 14),
                Expanded(child: _buildTitle(context, user)),
                if (isNeedSettings) const _ButtonOut(),
              ],
            ),
            const SizedBox(height: 12),
            const Hero(
              tag: "unique-tag",
              child: Material(
                type: MaterialType.transparency,
                child: LocationWidget(),
              ),
            )
          ],
        );
      },
    );
  }

  Widget _buildTitle(BuildContext context, User? user) {
    return Skeletonizer(
      enabled: user == null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Hero(
                tag: "Fio",
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    user?.fio.fullFio() ?? skeletonText,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Hero(
                tag: "Job",
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(
                    user?.jobTitle ?? skeletonText,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),

        ],
      ),
    );
  }
}

class _ButtonOut extends StatelessWidget {
  const _ButtonOut();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        child: SvgPicture.asset(
          "assets/icons/icon_settings.svg",
        ),
      ),
    );
  }
}
