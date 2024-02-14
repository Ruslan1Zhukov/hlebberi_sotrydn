import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/salary.dart';
import 'package:hlebberi_sotrydn/model/day_detail.dart';
import 'package:hlebberi_sotrydn/utils/month.dart';
import 'package:hlebberi_sotrydn/utils/price.dart';
import 'package:hlebberi_sotrydn/widgets/diagram.dart';
import 'package:hlebberi_sotrydn/widgets/legend.dart';

class MonthDetailPage extends StatelessWidget {
  const MonthDetailPage({
    super.key,
    required this.month,
  });

  final int month;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FutureBuilder<ApiResponse<SalaryReport>>(
        future: ApiSalary.monthDetail(date: month.toServer()),
        builder: (
            BuildContext context,
            AsyncSnapshot<ApiResponse<SalaryReport>> snapshot,
            ) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
            case ConnectionState.active:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text("Ошибка загрузки: ${snapshot.error}"));
              }
              final salaryReport = snapshot.data?.data;
              if (salaryReport == null) {
                return const Center(child: Text("Ошибка загрузки"));
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _TitleWidget(month: month, salaryReport: salaryReport),
                    const SizedBox(height: 29),
                    DiagramWidget(salary: salaryReport),
                    const SizedBox(height: 24),
                    LegendDetailsWidget(salaryReport: salaryReport),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}


class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.month,
    required this.salaryReport,
  });

  final int month;
  final SalaryReport salaryReport;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "Зарплата за\n${month.toMonthString}",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          "${salaryReport.total.toPriceString()} ₽",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
