import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/slider_data.dart';
import 'package:hlebberi_sotrydn/pages/month.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
import 'package:hlebberi_sotrydn/utils/price.dart';
import 'package:hlebberi_sotrydn/widgets/diagram.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

const _padding = EdgeInsets.symmetric(horizontal: 20.0);

class SalaryWidget extends StatefulWidget {
  const SalaryWidget({
    super.key,
    required this.month,
    required this.salary,
    required this.count,
  });

  final int? month;
  final Salary? salary;
  final int? count;

  @override
  State<SalaryWidget> createState() => _SalaryWidgetState();
}

class _SalaryWidgetState extends State<SalaryWidget> {
  DateTime dateTime = DateTime.now();

  void _openMonthDetailed(BuildContext context) {
    if (widget.month == null) return;
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
        if (month == null) {
          return SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width,
          );
        }
        return SingleChildScrollView(child: MonthDetailPage(month: month - 1));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final zpSum = widget.salary?.total ?? 0;
    final currentDate = DateFormat('dd.MM').format(DateTime.now());

    if (zpSum == 0 || widget.salary?.isNormal == false) {
      return Container(
        height: 112,
        margin: _padding,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: ColorProject.grey,
          ),
          color: ColorProject.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    const Text(
                      'Зарплата',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'на $currentDate     ',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Spacer(),
                const Text(
                  '0 ₽',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 11,
              decoration: BoxDecoration(
                color: const Color(0xFFE6E6E6),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: widget.month != null ? () => _openMonthDetailed(context) : null,
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
              const SizedBox(height: 17),
              DiagramWidget(salary: widget.salary),
            ],
          ),
        ),
      ),
    );
  }


  String getPluralForm(int count, String singular, String few, String many) {
    if (count % 10 == 1 && count % 100 != 11) {
      return singular;
    } else if (count % 10 >= 2 &&
        count % 10 <= 4 &&
        (count % 100 < 10 || count % 100 >= 20)) {
      return few;
    } else {
      return many;
    }
  }

  Widget buildTitle(BuildContext context) {
    var current = DateTime.now();
    var isCurrentMonth = current.month == widget.month;
    int count = widget.count ?? 0;
    String pluralForm = getPluralForm(count, "смену", "смены", "смен");

    String formattedDate;
    if (isCurrentMonth) {
      formattedDate = "на ${current.dMMMM()} за $count $pluralForm";
    } else {
      formattedDate = "за $count $pluralForm";
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
              "Зарплата",
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
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
        ),
      ],
    );
  }
}
