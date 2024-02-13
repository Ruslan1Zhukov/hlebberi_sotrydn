import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/response/slider_data.dart';
import 'package:hlebberi_sotrydn/pages/month.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
import 'package:hlebberi_sotrydn/utils/price.dart';
import 'package:hlebberi_sotrydn/widgets/diagram.dart';
import 'package:hlebberi_sotrydn/widgets/legend.dart';
import 'package:skeletonizer/skeletonizer.dart';

const _padding = EdgeInsets.symmetric(horizontal: 20.0);

class SalaryWidget extends StatefulWidget {
  const SalaryWidget({
    super.key,
    required this.month,
    required this.salary,
  });

  final int? month;
  final Salary? salary;

  @override
  State<SalaryWidget> createState() => _SalaryWidgetState();
}

class _SalaryWidgetState extends State<SalaryWidget> {
  DateTime dateTime = DateTime.now();

  void _openMonthDetailed(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      useSafeArea: true,
      showDragHandle: true,
      constraints: BoxConstraints(
        maxHeight: heightScreen - 80,
      ),
      builder: (BuildContext context) {
        final month = widget.month;
        if (month == null) return const SizedBox.shrink();
        return SingleChildScrollView(child: MonthDetailPage(month: month));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _openMonthDetailed(context);
      },
      child: Skeletonizer(
        enabled: widget.month == null,
        child: Container(
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
              DiagramWidget(salary: widget.salary),
              const SizedBox(height: 20),
              LegendWidget(labels: widget.salary?.labels.values.toList()),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    var current = DateTime.now();
    var isCurrentMonth = current.month == widget.month;
    String formattedDate;
    if (isCurrentMonth) {
      formattedDate = "на ${current.dMMMM(context)}";
    } else {
      formattedDate = "";
    }

    final zpSum = widget.salary?.total ?? 0;
    var formattedSum = zpSum.toPriceString();

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
