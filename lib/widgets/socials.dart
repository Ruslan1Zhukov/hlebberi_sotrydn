import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialsWidget extends StatelessWidget {
  const SocialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          iconSize: 40,
          icon: SvgPicture.asset(
            "assets/icons/icon_vk.svg",
          ),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 40,
          icon: SvgPicture.asset("assets/icons/icon_telegram.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}
