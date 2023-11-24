import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/enums/day_mode.dart';
import 'package:hlebberi_sotrydn/model/calendar_data.dart';
import 'package:hlebberi_sotrydn/pages/day.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

const Map<int, String> _mapDayOfWeek = {
  1: "Пн",
  2: "Вт",
  3: "Ср",
  4: "Чт",
  5: "Пт",
  6: "Сб",
  7: "Вс",
};

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
    required this.month,
    required this.data,
  });

  final DateTime month;
  final Map<DateTime, CalendarDay>? data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TableCalendar(
            headerVisible: false,
            rowHeight: 72,
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableGestures: AvailableGestures.none,
            calendarStyle: const CalendarStyle(outsideDaysVisible: false),
            calendarBuilders: CalendarBuilders(
              todayBuilder: _buildToday,
              defaultBuilder: _buildDay,
              dowBuilder: (_, day) => _DayOfWeek(dayOfWeek: day.weekday),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDay(_, day, focus) {
    var currentDay = DateTime.now();
    DayMode mode = (currentDay.isAfter(day)) ? DayMode.last : DayMode.future;
    if (data != null) {
      CalendarDay calendarDay = data![day] ?? CalendarDay.empty();
      return _Day(
        dateTime: day,
        dayData: calendarDay,
        mode: mode,
      );
    } else {
      CalendarDay? calendarDay = data?[day];
      return _Day(
        dateTime: day,
        dayData: calendarDay,
        mode: mode,
      );
    }
  }

  Widget _buildToday(_, day, focus) {
    if (data != null) {
      CalendarDay calendarDay = data![day] ?? CalendarDay.empty();
      return _Day(
        dateTime: day,
        dayData: calendarDay,
        mode: DayMode.current,
      );
    } else {
      CalendarDay? calendarDay = data?[day];
      return _Day(
        dateTime: day,
        dayData: calendarDay,
        mode: DayMode.current,
      );
    }
  }
}

class _DayOfWeek extends StatelessWidget {
  const _DayOfWeek({
    required this.dayOfWeek,
  });

  final int dayOfWeek;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        _mapDayOfWeek[dayOfWeek] ?? "ХЗ",
        style: TextStyle(
          color: const Color(0xFF1D1D1D).withOpacity(0.5),
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }
}

class _Day extends StatelessWidget {
  const _Day({
    required this.dateTime,
    required this.dayData,
    required this.mode,
  });

  final DateTime dateTime;
  final CalendarDay? dayData;
  final DayMode mode;

  _openDay(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(child: DayPage(initialDay: dateTime));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openDay(context),
      child: Opacity(
        opacity: mode.getOpacity(),
        child: Stack(
          children: [
            if (dayData == null) Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Skeletonizer(
                  enabled: true,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    margin: const EdgeInsets.all(3.5),
                    color: ColorProject.white,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.all(3.5),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: dayData?.type.getColor(),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFD9D9D9)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    dayData?.type.getLabelWidget() ?? const SizedBox.shrink(),
                    const Spacer(),
                    Text(dateTime.day.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
