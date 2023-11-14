import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hlebberi_sotrydn/model/user.dart';
import 'package:hlebberi_sotrydn/pages/setings.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/account.dart';
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
                const SizedBox(width: 20),
                AvatarWidget(user: user),
                const SizedBox(width: 14),
                Expanded(child: _buildTitle(user)),
                if (isNeedSettings) const _ButtonOut(),
              ],
            ),
            const SizedBox(height: 12),
            LocationWidget(user: user),
          ],
        );
      },
    );
  }

  Widget _buildTitle(User? user) {
    return Skeletonizer(
      enabled: user == null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user?.fio.fullFio() ?? skeletonText,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
          Text(
            user?.jobTitle ?? skeletonText,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
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
          MaterialPageRoute(builder: (context) => const SetingsPage()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 20,
        ),
        child: const Icon(
          Icons.settings,
          size: 24.0,
        ),
      ),
    );
  }
}

