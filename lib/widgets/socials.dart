import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialsWidget extends StatelessWidget {
  const SocialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/icon_vk.svg"),
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: SvgPicture.asset("assets/icons/icon_telegram.svg"),
          onPressed: () {},
        ),
      ],
    );
  }
}
