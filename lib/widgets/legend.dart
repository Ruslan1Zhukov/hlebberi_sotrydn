import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/response/slider_data.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({
    super.key,
    required this.labels,
  });

  final List<SalaryLabel>? labels;

  @override
  Widget build(BuildContext context) {
    final labels = this.labels;
    if (labels == null) {
      return const SizedBox.shrink();
    }
    return Wrap(
      spacing: 12,
      runSpacing: 6,
      children: [
        for (var label in labels) _Item(
          color: label.color,
          title: label.name,
          sum: null,
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.color,
    required this.title,
    required this.sum,
    this.isRed = false,
  });

  final String title;
  final Color color;
  final String? sum;
  final bool isRed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 7,
          height: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(title),
        if (sum != null) const Spacer(),
        if (sum != null)
          Text(
            sum!,
            style: TextStyle(
              color: (isRed) ? ColorProject.red : ColorProject.black,
            ),
          ),
      ],
    );
  }
}

class LegendWidgetDay extends StatelessWidget {
  const LegendWidgetDay({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Item(
          color: ColorProject.orange,
          title: 'Оклад',
          sum: '1000',
        ),
        SizedBox(height: 4),
        _Item(
          color: ColorProject.lightBlue,
          title: 'Премия за день',
          sum: '600',
        ),
        SizedBox(height: 4),
        Text(
          'Комментарий: Хорошо убрались',
          style: TextStyle(color: ColorProject.grey),
        ),
        _Item(
          color: ColorProject.blue,
          title: 'Процент с продаж',
          sum: '200',
        ),
        SizedBox(height: 4),
        _Item(
          color: Color(0xFFE5E5E5),
          title: 'Демотивация за день',
          sum: '100',
        ),
        SizedBox(height: 4),
        Text(
          'Комментарий: Плохо убрались',
          style: TextStyle(color: ColorProject.grey),
        ),
      ],
    );
  }
}

class LegendWidgetZp extends StatelessWidget {
  const LegendWidgetZp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Item(
          color: ColorProject.orange,
          title: 'Оклад за месяц',
          sum: '12 000',
        ),
        SizedBox(height: 4),
        _Item(
          color: ColorProject.blue,
          title: 'Премия за месяц',
          sum: '5000',
        ),
        SizedBox(height: 4),
        Text(
          'Комментарий: Хорошо убрались',
          style: TextStyle(color: ColorProject.grey),
        ),
        _Item(
          color: ColorProject.pink,
          title: 'Больничный',
          sum: '2000',
        ),
        SizedBox(height: 4),
        _Item(
          color: ColorProject.red,
          title: 'Демотивация за месяц',
          sum: '2000',
          isRed: true,
        ),
        Text(
          'Комментарий: Плохо убрались',
          style: TextStyle(color: ColorProject.grey),
        ),
        SizedBox(height: 4),
        _Item(
          color: ColorProject.grey,
          title: 'Компенсация за сан. книжку',
          sum: '500',
        ),
        Text(
          'Комментарий: возврат 50%',
          style: TextStyle(color: ColorProject.grey),
        ),
        SizedBox(height: 4),
        _Item(
          color: ColorProject.lightBlue,
          title: 'Отпуск',
          sum: '500',
        ),
        Text(
          'Комментарий: возврат 50%',
          style: TextStyle(color: ColorProject.grey),
        ),
        SizedBox(height: 4),
        _Item(
          color: ColorProject.green,
          title: '% с продаж',
          sum: '500',
        ),
        Text(
          'Комментарий: возврат 50%',
          style: TextStyle(color: ColorProject.grey),
        ),
        SizedBox(height: 4),
        _Item(
          color: ColorProject.ndfl,
          title: 'НДФЛ',
          sum: '500',
        ),
        Text(
          'Комментарий: возврат 50%',
          style: TextStyle(color: ColorProject.grey),
        ),
      ],
    );
  }
}
