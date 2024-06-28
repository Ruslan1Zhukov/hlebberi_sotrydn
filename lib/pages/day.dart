import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hlebberi_sotrydn/model/day_detail.dart';
import 'package:hlebberi_sotrydn/redux/app_state.dart';
import 'package:hlebberi_sotrydn/redux/thunk/slider.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
import 'package:hlebberi_sotrydn/widgets/salary_day.dart';

const _count = 10000;
const _initialPage = 5000;

class DayDetailPage extends StatelessWidget {
  const DayDetailPage({
    super.key,
    required this.initialDay,
  });

  final DateTime initialDay;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: _count,
      options: CarouselOptions(
        height: 500,
        viewportFraction: 1,
        initialPage: _initialPage,
      ),
      itemBuilder: (context, index, realIndex) {
        final date = initialDay.add(Duration(days: index - _initialPage));
        final savedDayDetail = store.state.slider.days[date];
        if (savedDayDetail == null) {
          store.dispatch(setDayDetailedData(date));
        }
        return StoreConnector<AppState, DayDetail?>(
          converter: (store) => store.state.slider.days[date],
          builder: (context, dayDetail) {
            if (dayDetail == null) {
              return const Center(child: CircularProgressIndicator());
            }
            final role = dayDetail.userShift?.role;
            final location = dayDetail.userShift?.location;
            final zpSum = dayDetail.salary?.total ?? 0;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _DateTime(
                      dayDetail: dayDetail,
                      dateMonth: date.dMMMMDayOfWeek(),
                    ),
                    const SizedBox(height: 30),
                    if (role != null) _Position(role: role),
                    if (role != null) const SizedBox(height: 20),
                    if (location != null) _Location(location: location),
                    if (location != null) const SizedBox(height: 32),
                    if (zpSum > 0) SalaryDayWidget(
                      salaryReport: dayDetail.salary,
                      isCurrentDay: date.isCurrent(),
                    ),
                    if (zpSum == 0) Column(
                      children: [
                        Center(
                          child: SizedBox(
                            width: 61,
                            height: 67,
                            child: Image.asset('assets/images/salary.png'),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Тут будет ваша зарплата',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorProject.black,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                    if (dayDetail.salary.report.isEmpty && zpSum != 0) const Text("Нет данных"),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _DateTime extends StatelessWidget {
  const _DateTime({
    required this.dateMonth,
    required this.dayDetail,
  });

  final String dateMonth;
  final DayDetail dayDetail;

  @override
  Widget build(BuildContext context) {
    final userShift = dayDetail.userShift;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dateMonth,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        const Spacer(),
        if (userShift != null) ColorFiltered(
          colorFilter: const ColorFilter.mode(
            ColorProject.orange,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset("assets/icons/icon_clock.svg"),
        ),
        if (userShift != null) const SizedBox(width: 4),
        if (userShift != null) Text(
          userShift.time(context),
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _Position extends StatelessWidget {
  const _Position({
    required this.role,
  });

  final String role;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            ColorProject.grey,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset("assets/icons/icon_profile.svg"),
        ),
        const SizedBox(width: 13),
        Text(
          role,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _Location extends StatelessWidget {
  const _Location({
    required this.location,
  });

  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            ColorProject.grey,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset("assets/icons/icon_locat.svg"),
        ),
        const SizedBox(width: 12),
        Text(location),
      ],
    );
  }
}
