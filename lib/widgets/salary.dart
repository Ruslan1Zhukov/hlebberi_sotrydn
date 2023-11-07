import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/zp.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/widgets/diagram.dart';
import 'package:hlebberi_sotrydn/widgets/legend.dart';
import 'package:intl/intl.dart';

const _padding = EdgeInsets.symmetric(horizontal: 20.0);

class SalaryWidget extends StatelessWidget {
  const SalaryWidget({
    super.key,
    required this.month,
    required this.zp,
  });

  final int month;
  final Zp? zp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: _padding,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: ColorProject.grey,
        ),
        color: ColorProject.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(context),
          const SizedBox(height: 20),
          DiagramWidget(zp: zp),
          const SizedBox(height: 20),
          const LegendWidget(),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    var current = DateTime.now();
    var isCurrentMonth = current.month == month;
    String formattedDate;
    if (isCurrentMonth) {
      formattedDate = "на ${DateFormat('dd.MM').format(current)}";
    } else {
      formattedDate = "";
    }

    final zpSum = zp?.sum ?? 0;
    String formattedSum;

    final numberFormat = NumberFormat('#,###', 'ru_RU');

    formattedSum = numberFormat.format(zpSum);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Всего",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              formattedDate,
              style: const TextStyle(fontWeight: FontWeight.w200, fontSize: 12),
            ),
          ],
        ),
        const Spacer(),
        Text(
          "$formattedSum ₽",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
        ),
      ],
    );
  }
}