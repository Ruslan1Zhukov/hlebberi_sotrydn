import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/user.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  void _openMap(BuildContext context) async {
    final mapUrl = 'https://www.google.com/maps/place/${user.location}';
    final uri = Uri.parse(mapUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Невозможно открыть карту"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var radius = BorderRadius.circular(100);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: radius,
        child: InkWell(
          onTap: () => _openMap(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: radius,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on,
                  color: ColorProject.orange,
                ),
                const SizedBox(width: 6),
                Expanded(child: Text(user.location)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
