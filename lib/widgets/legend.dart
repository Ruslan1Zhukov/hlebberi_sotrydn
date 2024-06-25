import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/day_detail.dart';
import 'package:hlebberi_sotrydn/model/slider_data.dart';
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
        for (var label in labels)
          _Item(
            color: label.color,
            title: label.name,
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

class LegendDetailsWidget extends StatelessWidget {
  const LegendDetailsWidget({
    super.key,
    required this.salaryReport,
  });

  final SalaryReport salaryReport;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (var detailItem in salaryReport.detailList) {
      SalaryLabel? label = salaryReport.labels[detailItem.type];
      if (label == null) continue;
      list.add(_ItemDetail(
        title: label.name,
        color: label.color,
        sum: detailItem.amount.toString(),
        colored: label.colored,
        comment: detailItem.comment,
      ));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: list,
    );
  }
}

class _ItemDetail extends StatelessWidget {
  const _ItemDetail({
    required this.title,
    required this.color,
    required this.sum,
    required this.colored,
    required this.comment,
  });

  final String title;
  final Color color;
  final String? sum;
  final Color? colored;
  final String? comment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        children: [
          Row(
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
                    color: colored ?? ColorProject.black,
                  ),
                ),
            ],
          ),
          if (comment != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Комментарий: $comment',
                    style: const TextStyle(color: ColorProject.grey),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}