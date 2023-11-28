import 'package:flutter/material.dart';

class ListTileProject extends StatelessWidget {
  const ListTileProject({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    this.arrow = true,
  });

  final String title;
  final Widget? icon;
  final GestureTapCallback? onTap;
  final bool arrow;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      trailing: arrow ? const Icon(Icons.chevron_right) : null,
      title: Row(
        children: [
          icon ?? const SizedBox.shrink(),
          icon != null ? const SizedBox(width: 9) : const SizedBox.shrink(),
          Expanded(child: Text(title)),
        ],
      ),
    );
  }
}
