import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hlebberi_sotrydn/helpers/dialogs.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/theme/list_tile.dart';

class ChangeImageButton extends StatelessWidget {
  const ChangeImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String?>(
      converter: (store) => store.state.account.user?.avatarUrl,
      builder: (context, avatarUrl) {
        var title =
            avatarUrl == null ? 'Добавить фотографию' : 'Изменить фотографию';
        var onTap = avatarUrl == null
            ? () => showAddAvatarDialog(context)
            : () => showChangeAvatarDialog(context);
        return ListTileProject(
          title: title,
          onTap: onTap,
          icon: SvgPicture.asset(
            "assets/icons/icon_izmena.svg",
            colorFilter: const ColorFilter.mode(
              ColorProject.orange,
              BlendMode.srcIn,
            ),
          ),
        );
      },
    );
  }
}

class InfoButton extends StatelessWidget {
  const InfoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/info",
          (Route<dynamic> route) => false,
        );
      },
      child: Container(
        decoration: const BoxDecoration(),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: ColorProject.orange,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'i',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text('Открыть обучение'),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
              color: ColorProject.black,
            ),
          ],
        ),
      ),
    );
  }
}
