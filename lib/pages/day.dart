import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hlebberi_sotrydn/model/one_day.dart';
import 'package:hlebberi_sotrydn/test_data.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
import 'package:hlebberi_sotrydn/widgets/salary_day.dart';

const _count = 10000;
const _initialPage = 5000;

class DayPage extends StatelessWidget {
  const DayPage({
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
        var newDateTime =
            initialDay.add(Duration(days: index - _initialPage));
        var oneDay = testOneDay(newDateTime);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              _DateTime(
                oneDay: oneDay,
                dateMonth: oneDay.data.dMMMMDayOfWeek(context),
              ),
              const SizedBox(height: 30),
              _Position(oneDay: oneDay),
              const SizedBox(height: 20),
              _Location(oneDay: oneDay),
              const SizedBox(height: 50),
              const _TitleSalary(),
              const SizedBox(height: 15),
              SalaryDayWidget(zp: oneDay.zp),
            ],
          ),
        );
      },
    );
  }
}

class _DateTime extends StatelessWidget {
  const _DateTime({
    required this.dateMonth,
    required this.oneDay,
  });

  final String dateMonth;
  final OneDay oneDay;

  @override
  Widget build(BuildContext context) {
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
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            ColorProject.orange,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset("assets/icons/icon_clock.svg"),
        ),
        const SizedBox(width: 4),
        Text(
          oneDay.time,
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
    required this.oneDay,
  });

  final OneDay oneDay;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/icon_profile.svg"),
        const SizedBox(width: 13),
        Text(
          oneDay.jobTitle,
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
    required this.oneDay,
  });

  final OneDay oneDay;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset("assets/icons/icon_locat.svg"),
        const SizedBox(width: 12),
        Text(oneDay.location),
      ],
    );
  }
}

class _TitleSalary extends StatelessWidget {
  const _TitleSalary();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          "Зарплата",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
