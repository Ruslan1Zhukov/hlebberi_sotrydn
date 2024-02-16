import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/helpers/plot_width.dart';
import 'package:hlebberi_sotrydn/model/slider_data.dart';
import 'package:hlebberi_sotrydn/utils/price.dart';

const double _radius = 27;

class DiagramWidget extends StatelessWidget {
  const DiagramWidget({
    super.key,
    required this.salary,
  });

  final Salary? salary;

  @override
  Widget build(BuildContext context) {
    var salary = this.salary;
    if (salary == null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 27,
              alignment: Alignment.center,
              child: const Text("Нет данных"),
            ),
          ],
        ),
      );
    }
    var widthScreen = MediaQuery.of(context).size.width;
    var count = salary.report.length.toDouble();
    var sum = salary.sumDouble();
    List<Widget> list = [];
    salary.report.forEach((key, value) {
      final label = salary.labels[key];
      if (label == null) return;
      final flex = systemPlot(
        widthScreen: widthScreen,
        count: count,
        sum: sum,
        value: value,
      );
      list.add(
        _Item(
          label: label,
          value: value,
          flex: flex,
        ),
      );
    });
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.label,
    required this.value,
    required this.flex,
  });

  final SalaryLabel label;
  final int value;
  final double flex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex.toInt(),
      child: Container(
        height: 27,
        alignment: Alignment.center,
        color: label.color,
        child: Text(
          value.toPriceString(),
          maxLines: 1,
        ),
      ),
    );
  }
}
