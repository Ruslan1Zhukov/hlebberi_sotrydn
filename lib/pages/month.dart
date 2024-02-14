import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hlebberi_sotrydn/model/day_detail.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/slider.dart';
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
    return SizedBox(
      height: 500,
      child: StoreConnector<AppState, SalaryReport?>(
        converter: (store) => store.state.slider.month[month],
        builder: (context, salaryReport) {
          if (salaryReport == null) {
            store.dispatch(setMonthDetailedData(month));
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
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
            ),
          );
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
