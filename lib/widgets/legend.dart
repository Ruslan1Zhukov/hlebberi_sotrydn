import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 12,
      runSpacing: 6,
      children: [
        _Item(
          color: ColorProject.orange,
          title: 'Оклад',
        ),
        _Item(
          color: ColorProject.pink,
          title: 'Премия (месяц)',
        ),
        _Item(
          color: ColorProject.lightBlue,
          title: 'Премия (день)',
        ),
        _Item(
          color: ColorProject.blue,
          title: 'Процент с продаж',
        ),
        _Item(
          color: Color(0xFFE5E5E5),
          title: 'Демотивация',
        ),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    required this.color,
    required this.title,
  });

  final String title;
  final Color color;

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
        ),
        SizedBox(height: 4), // Adding space between items
        Text(
          'Комментарий: Цвет D9D9D9',
          style: TextStyle(color: Color(0xFFD9D9D9)),
        ),
        _Item(
          color: ColorProject.lightBlue,
          title: 'Премия за день',
        ),
        SizedBox(height: 4),
        Text(
          'Комментарий: Хорошо убрались',
          style: TextStyle(color: ColorProject.grey),
        ),
        _Item(
          color: ColorProject.blue,
          title: 'Процент с продаж',
        ),
        SizedBox(height: 4),
        Text(
          'Комментарий: Цвет D9D9D9',
          style: TextStyle(color: Color(0xFFD9D9D9)),
        ),
        _Item(
          color: Color(0xFFE5E5E5),
          title: 'Демотивация за день',
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

