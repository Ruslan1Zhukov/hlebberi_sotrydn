import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/theme/list_tile.dart';
import 'package:hlebberi_sotrydn/theme/scaffold.dart';
import 'package:hlebberi_sotrydn/widgets/back.dart';
import 'package:hlebberi_sotrydn/widgets/change_image.dart';
import 'package:hlebberi_sotrydn/widgets/header.dart';
import 'package:hlebberi_sotrydn/widgets/logout.dart';
import 'package:hlebberi_sotrydn/widgets/socials.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldProject(
      isQRScan: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const BackWidget(title: "Информация"),
              const SizedBox(height: 32),
              const HeaderWidget(isNeedSettings: false),
              const Divider(),
              const SizedBox(height: 15),
              const ChangeImageButton(),
              const Divider(),
              const SizedBox(height: 30),
              ListTileProject(
                title: 'Пользовательское соглашение',
                onTap: () {},
              ),
              const Divider(),
              ListTileProject(
                title: 'Правовые документы',
                onTap: () {},
              ),
              const Divider(),
              ListTileProject(
                title: 'Обратная связь',
                onTap: () {},
              ),
              const Divider(),
              const SizedBox(height: 35),
              const SocialsWidget(),
              const SizedBox(height: 40),
              const LogoutWidget(),
            ],
          ),
        ),
      ),
    );
  }
}



