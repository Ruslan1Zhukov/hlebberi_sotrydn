import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/zp.dart';
import 'package:hlebberi_sotrydn/widgets/diagram.dart';
import 'package:hlebberi_sotrydn/widgets/legend.dart';

class SalaryDayWidget extends StatelessWidget {
  const SalaryDayWidget({
    super.key,
    required this.zp,
  });

  final Zp zp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFFD9D9D9),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTitle(),
          const SizedBox(height: 20),
          DiagramWidget(zp: zp),
          const SizedBox(height: 20),
          const LegendWidget(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Всего",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ],
        ),
        const Spacer(),
        Text(
          "${zp.sum} P",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
        ),
      ],
    );
  }
}
