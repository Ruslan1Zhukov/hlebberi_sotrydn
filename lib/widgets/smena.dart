import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/smena.dart';
import 'package:hlebberi_sotrydn/model/smena_data.dart';
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
  ApiResponse<Smena>? _response;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final response = await ApiSmena.smena();
      setState(() {
        _response = response;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_response is ApiResponseError) {
      return const SizedBox.shrink();
    }
    final smena = (_response as ApiResponseData<Smena?>?)?.data;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 32,
      ),
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
                enabled: _response == null,
                child: Text(
                  smena?.timePlan() ?? "-----------------------",
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
                enabled: _response == null,
                child: Text(
                  smena?.timeFact(context) ?? "-----------------------",
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
              for (var user
                  in smena?.users ?? [User.empty(), User.empty(), User.empty()])
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AvatarWidget(
                      isLoading: _response == null,
                      avatarUrl: user.avatar,
                      fio: user.fio,
                      size: 55,
                    ),
                    const SizedBox(height: 4),
                    _response == null
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
                              fontSize: 8,
                              color: ColorProject.black,
                            ),
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
