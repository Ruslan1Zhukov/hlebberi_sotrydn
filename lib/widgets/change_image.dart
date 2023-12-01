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
              ColorProject.orange, // Цвет фильтра
              BlendMode.srcIn, // Режим наложения
            ),
          ),
        );
      },
    );
  }
}
