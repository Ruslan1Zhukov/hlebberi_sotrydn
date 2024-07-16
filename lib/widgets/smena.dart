import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/model/smena_data.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/state/smena.dart';
import 'package:hlebberi_sotrydn/redux/thunk/smena.dart';
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
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await store.dispatch(setSmenaData());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SmenaState>(
      converter: (store) => store.state.smena,
      builder: (context, state) {
        final response = state.response;
        if (response is ApiResponseError) return const SizedBox.shrink();
        if (response is ApiResponseData) {
          if ((response as ApiResponseData<Smena>).data.isNotValid) {
            return const SizedBox.shrink();
          }
        }
        final smena = (response as ApiResponseData<Smena?>?)?.data;
        return Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
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
              Row(
                children: [
                  const Icon(
                    Icons.access_time_filled,
                    color: ColorProject.grey,
                  ),
                  Expanded(
                    child: Skeletonizer(
                      enabled: response == null,
                      child: Text(
                        smena?.timePlan() ?? "-----------------------",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  // const Spacer(),
                  const SizedBox(width: 20),
                  const Icon(
                    Icons.access_time_filled,
                    color: ColorProject.orange,
                  ),
                  Expanded(
                    child: Skeletonizer(
                      enabled: response == null,
                      child: Text(
                        smena?.timeFact(context) ?? "-----------------------",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (smena?.users.isNotEmpty ?? true)
              if (smena?.users.isNotEmpty ?? true)
              if (smena?.users.isNotEmpty ?? true) const SizedBox(height: 4),
              if (smena?.users.isNotEmpty ?? true)
                Wrap(
                  spacing: 5,
                  runSpacing: 4,
                  children: [
                    for (var user in smena?.users ??
                        [User.empty(), User.empty(), User.empty()])
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AvatarWidget(
                            isLoading: response == null,
                            avatarUrl: user.avatar,
                            fio: user.fio,
                            size: 46,
                          ),
                          const SizedBox(height: 4),
                          response == null
                              ? Skeletonizer(
                                  enabled: true,
                                  child: Container(
                                    width: 46,
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
      },
    );
  }
}
