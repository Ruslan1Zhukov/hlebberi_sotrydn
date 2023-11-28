import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/smena.dart';
import 'package:hlebberi_sotrydn/test_data.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/widgets/avatar.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SmenaWidget extends StatefulWidget {
  const SmenaWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<SmenaWidget> createState() => _SmenaWidgetState();
}

class _SmenaWidgetState extends State<SmenaWidget> {
  Smena? smena;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3));
      setState(() {
        smena = testSmena;
      });
    });
    super.initState();
  }

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
                color: ColorProject.grey,
              ),
              const SizedBox(width: 6),
              Skeletonizer(
                enabled: smena == null,
                child: Text(
                  smena?.timePlan ?? "-----------------------",
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.access_time_filled,
                color: ColorProject.orange,
              ),
              const SizedBox(width: 6),
              Skeletonizer(
                enabled: smena == null,
                child: Text(
                  smena?.timeFact ?? "-----------------------",
                ),
              ),
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
              for (var user in smena?.users ?? skeletonUsers)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AvatarWidget(
                      isLoading: smena == null,
                      avatarUrl: user.avatarUrl,
                      fio: user.fio,
                      size: 55,
                    ),
                    const SizedBox(height: 4),
                    smena == null
                        ? Skeletonizer(
                            enabled: true,
                            child: Container(
                              width: 55,
                              height: 12,
                              color: ColorProject.error,
                            ),
                          )
                        : Text(
                            user.fio.fullFio2(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 8, color: ColorProject.black),
                          ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }
}
