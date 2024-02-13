import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hlebberi_sotrydn/api/_api_response.dart';
import 'package:hlebberi_sotrydn/api/zp.dart';
import 'package:hlebberi_sotrydn/model/response/day_detail.dart';
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
        return FutureBuilder<ApiResponse<DayDetail>>(
          future: ApiZp.dayDetail(date: date.toServer(context)),
          builder: (
            BuildContext context,
            AsyncSnapshot<ApiResponse<DayDetail>> snapshot,
          ) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
              case ConnectionState.none:
              case ConnectionState.active:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                final dayDetail = snapshot.data?.data;
                if (dayDetail == null) {
                  return const Center(child: Text("Ошибка загрузки"));
                }
                final role = dayDetail.userShift?.role;
                final location = dayDetail.userShift?.location;
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _DateTime(
                          dayDetail: dayDetail,
                          dateMonth: date.dMMMMDayOfWeek(context),
                        ),
                        const SizedBox(height: 30),
                        if (role != null) _Position(role: role),
                        if (role != null) const SizedBox(height: 20),
                        if (location != null) _Location(location: location),
                        if (location != null) const SizedBox(height: 32),
                        if (dayDetail.salary.report.isNotEmpty) SalaryDayWidget(
                          salaryReport: dayDetail.salary,
                          isCurrentDay: date.isCurrent(),
                        ),
                        if (dayDetail.salary.report.isEmpty) const Text("Нет данных"),
                      ],
                    ),
                  ),
                );
            }
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
