import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/zp.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
import 'package:hlebberi_sotrydn/widgets/diagram.dart';
import 'package:hlebberi_sotrydn/widgets/legend.dart';

class SalaryDayWidget extends StatelessWidget {
  const SalaryDayWidget({
    super.key,
    required this.zp,
    required this.isCurrentDay,
  });

  final Zp zp;
  final bool isCurrentDay;

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
          buildTitle(context),
          const SizedBox(height: 20),
          DiagramWidget(zp: zp),
          const SizedBox(height: 20),
          const LegendWidgetDay(),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    String currentDate = (isCurrentDay) ? "на ${DateTime.now().dMMMM(context)}" : "";
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Зарплата",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          currentDate,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: ColorProject.beige,
          ),
        ),
      ],
    );
  }
}
