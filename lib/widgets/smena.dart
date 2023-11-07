import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/smena.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/widgets/avatar.dart';

class SmenaWidget extends StatelessWidget {
  const SmenaWidget({
    Key? key,
    required this.smena,
  }) : super(key: key);

  final Smena smena;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: ColorProject.white,
        border: Border.all(
          color: ColorProject.beige,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Смена',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.access_time_filled,
                color: ColorProject.orange,
              ),
              const SizedBox(width: 6),
              Text(
                smena.timePlan,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.access_time_filled,
                color: ColorProject.grey,
              ),
              const SizedBox(width: 6),
              Text(
                smena.timeFact,
              ),
              const Text("-открыта"),
            ],
          ),
          const SizedBox(height: 14.5),
          const Text(
            "В смене",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 17,
            runSpacing: 4,
            children: [
              for (var user in smena.users)
                _SmenaAvatarWidget(
                  user: user,
                ),
            ],
          ),
        ],
      ),
    );
  }
}

const double _size = 65;

class _SmenaAvatarWidget extends StatelessWidget {
  const _SmenaAvatarWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserSmena user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return FullScreenImageScreen(
                  imageUrl: user.avatarUrl,
                );
              },
            ));
          },
          child: Hero(
            tag: user.avatarUrl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_size),
              child: Image.network(
                user.avatarUrl,
                fit: BoxFit.cover,
                width: _size,
                height: _size,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          user.fio,
          style: const TextStyle(fontSize: 8),
        ),
      ],
    );
  }
}
