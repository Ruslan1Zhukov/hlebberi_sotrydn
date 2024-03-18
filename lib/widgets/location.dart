import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hlebberi_sotrydn/model/smena_data.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

final radius = BorderRadius.circular(100);

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Smena?>(
      converter: (store) => store.state.smena.smena,
      builder: (context, smena) {
        final location = smena?.location;
        if (location == null) return const SizedBox.shrink();
        return ClipRRect(
          borderRadius: radius,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: radius,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on,
                  size: 20,
                  color: ColorProject.orange,
                ),
                const SizedBox(width: 6),
                Expanded(child: Text(location)),
              ],
            ),
          ),
        );
      },
    );
  }
}
