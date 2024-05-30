import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hlebberi_sotrydn/model/slider_data.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/slider.dart';
import 'package:hlebberi_sotrydn/utils/month.dart';
import 'package:hlebberi_sotrydn/widgets/calendar.dart';
import 'package:hlebberi_sotrydn/widgets/salary.dart';

class SlideWidget extends StatelessWidget {
  const SlideWidget({super.key,
    required this.month,
  });

  final int month;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SliderData?>(
      converter: (store) => store.state.slider.data[month],
      builder: (context, dataMonth) {
        if (dataMonth == null) {
          store.dispatch(setSliderData(month));
        }
        var monthDateTime = month.toDateTime;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SalaryWidget(
              salary: dataMonth?.salary,
              month: (dataMonth == null) ? null : month,
              count: dataMonth?.workSchedule.count,
            ),
            const SizedBox(height: 15),
            CalendarWidget(
              month: monthDateTime,
              workSchedule: dataMonth?.workSchedule,
            ),
          ],
        );
      },
    );
  }
}