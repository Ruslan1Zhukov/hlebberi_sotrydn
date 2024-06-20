import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/utils/month.dart';

Future<int?> showSelectMonth(BuildContext context) async {
  return await showModalBottomSheet<int>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      List<Widget> list = mapMonths.entries.map((e) {
        return InkWell(
          onTap: () => Navigator.pop(context, e.key),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 20,
            ),
            child: Text(
              e.key.toMonthYearString,
              textAlign: TextAlign.start,
            ),
          ),
        );
      }).toList();
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: list,
          ),
        ),
      );
    },
  );
}
