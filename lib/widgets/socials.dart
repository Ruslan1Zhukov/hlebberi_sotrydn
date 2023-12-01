import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

class SocialsWidget extends StatelessWidget {
  const SocialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Transform.scale(
            scale: 1.5,
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                ColorProject.orange,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset("assets/icons/icon_vk.svg"),
            ),
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: Transform.scale(
            scale: 1.5,
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                ColorProject.orange,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset("assets/icons/icon_telegram.svg"),
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
