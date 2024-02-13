import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/zp.dart';
import 'package:hlebberi_sotrydn/model/response/day_detail.dart';
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
    return FutureBuilder<ApiResponse<SalaryReport>>(
      future: ApiZp.monthDetail(date: month.toServer()),
      builder: (
        BuildContext context,
        AsyncSnapshot<ApiResponse<SalaryReport>> snapshot,
      ) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
          case ConnectionState.active:
            return const CircularProgressIndicator();
          case ConnectionState.done:
            final salaryReport = snapshot.data?.data;
            if (salaryReport == null) {
              return const Center(child: Text("Ошибка загрузки"));
            }
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _TitleWidget(month: month, salaryReport: salaryReport),
                    const SizedBox(height: 29),
                    DiagramWidget(salary: salaryReport),
                    const SizedBox(height: 24),
                    LegendDetailsWidget(salaryReport: salaryReport),
                  ],
                ),
              ),
            );
        }
      },
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
