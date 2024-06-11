import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/enums/day_mode.dart';
import 'package:hlebberi_sotrydn/model/slider_data.dart';
import 'package:hlebberi_sotrydn/pages/day.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
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
const _fontWeightLight = FontWeight.w300;
const _fontWeightBold = FontWeight.w700;

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({
    super.key,
    required this.month,
    required this.workSchedule,
  });

  final DateTime month;
  final WorkSchedule? workSchedule;

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
              dowBuilder: (_, day) => _DayOfWeek(dateTime: day),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDay(context, DateTime day, focus) {
    var currentDay = DateTime.now();
    DayMode mode = (currentDay.isAfter(day)) ? DayMode.last : DayMode.future;
    final dateKey = day.yyyy_mm_dd();
    final keyOfLabel = workSchedule?.report[dateKey];
    if (keyOfLabel == null) {
      final label = workSchedule?.labels["not_working_day"];
      return _Day(
        dateTime: day,
        mode: mode,
        color: label?.color ?? ColorProject.white,
        label: label?.icon ?? const SizedBox.shrink(),
        isExistDate: false,
      );
    }
    final isExistDate = workSchedule?.existDates.contains(dateKey) ?? false;
    if (keyOfLabel.length > 2) {
      final label = workSchedule?.labels[keyOfLabel];
      if (label == null) {
        return _Day(
          dateTime: day,
          mode: mode,
          color: ColorProject.white,
          label: const SizedBox.shrink(),
          isExistDate: isExistDate,
        );
      }
      return _Day(
        dateTime: day,
        mode: mode,
        color: label.color,
        label: label.icon,
        isExistDate: isExistDate,
      );
    }
    final color = workSchedule?.labels["default"]?.color;
    return _Day(
      dateTime: day,
      mode: mode,
      color: color,
      label: Text(keyOfLabel),
      isExistDate: isExistDate,
    );
  }

  Widget _buildToday(context, DateTime day, focus) {
    DayMode mode = DayMode.current;
    final dateKey = day.yyyy_mm_dd();
    final keyOfLabel = workSchedule?.report[dateKey];
    if (keyOfLabel == null) {
      final label = workSchedule?.labels["not_working_day"];
      return _Day(
        dateTime: day,
        mode: mode,
        color: label?.color ?? ColorProject.white,
        label: label?.icon ?? const SizedBox.shrink(),
        isExistDate: false,
      );
    }
    final isExistDate = workSchedule?.existDates.contains(dateKey) ?? false;
    if (keyOfLabel.length > 2) {
      final label = workSchedule?.labels[keyOfLabel];
      if (label == null) {
        return _Day(
          dateTime: day,
          mode: mode,
          color: ColorProject.white,
          label: const SizedBox.shrink(),
          isExistDate: isExistDate,
        );
      }
      return _Day(
        dateTime: day,
        mode: mode,
        color: label.color,
        label: label.icon,
        isExistDate: isExistDate,
      );
    }
    final color = workSchedule?.labels["default"]?.color;
    return _Day(
      dateTime: day,
      mode: mode,
      color: color,
      label: Text(keyOfLabel),
      isExistDate: isExistDate,
    );
  }
}

class _DayOfWeek extends StatelessWidget {
  const _DayOfWeek({
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    var dayOfWeek = dateTime.weekday;
    return Center(
      child: Text(
        _mapDayOfWeek[dayOfWeek] ?? "ХЗ",
        style: TextStyle(
          color:
              const Color(0xFF1D1D1D).withOpacity(_determineOpacity(dayOfWeek)),
          fontWeight: _determineFontWeight(dayOfWeek),
          fontSize: 12,
        ),
      ),
    );
  }

  FontWeight _determineFontWeight(int day) {
    var now = DateTime.now();
    int currentDayOfWeek = now.weekday;
    if (dateTime.year != now.year || dateTime.month != now.month) {
      return _fontWeightLight;
    }
    return day == currentDayOfWeek ? _fontWeightBold : _fontWeightLight;
  }

  double _determineOpacity(int day) {
    var now = DateTime.now();
    int currentDayOfWeek = now.weekday;
    if (dateTime.year != now.year || dateTime.month != now.month) {
      return 0.5;
    }
    return day == currentDayOfWeek ? 1 : 0.5;
  }
}

class _Day extends StatelessWidget {
  const _Day({
    required this.dateTime,
    required this.mode,
    required this.color,
    required this.label,
    required this.isExistDate,
  });

  final DateTime dateTime;
  final DayMode mode;
  final Color? color;
  final Widget? label;
  final bool isExistDate;

  _openDay(BuildContext context) {
    var heightScreen = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      useSafeArea: true,
      showDragHandle: true,
      constraints: BoxConstraints(
        maxHeight: heightScreen - 80,
      ),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: DayDetailPage(initialDay: dateTime),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openDay(context),
      child: Stack(
        children: [
          if (label == null)
            Positioned.fill(
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
          if (label != null)
            Positioned.fill(
              child: Opacity(
                opacity: mode.getOpacity(),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.all(3.5),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: isExistDate ? Colors.red : color,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: mode.colorBorder,
                      width: mode.widthBorder,
                    ),
                  ),
                  child: const SizedBox.shrink(),
                ),
              ),
            ),
          if (label != null)
            Positioned.fill(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: const EdgeInsets.all(3.5),
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    label ?? const SizedBox.shrink(),
                    const Spacer(),
                    Text(dateTime.day.toString()),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}