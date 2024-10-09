import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/helpers/month.dart';
import 'package:hlebberi_sotrydn/utils/date_time.dart';
import 'package:hlebberi_sotrydn/utils/month.dart';
import 'package:hlebberi_sotrydn/widgets/slide.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  final CarouselSliderController _controller = CarouselSliderController();
  final int _monthNow = DateTime.now().firstDayOfMonth().monthFrom0;
  int _monthCurrent = DateTime.now().monthFrom0;

  _changeMonth(int month) {
    setState(() {
      _monthCurrent = month;
    });
  }

  _onChangeMonth(int month) {
    _changeMonth(month);
    _controller.animateToPage(month);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _TitleWidget(
            monthCurrent: _monthCurrent,
            onChangeMonth: _onChangeMonth,
          ),
        ),
        const SizedBox(height: 12),
        CarouselSlider.builder(
          itemCount: 12,
          carouselController: _controller,
          options: CarouselOptions(
            height: 750,
            viewportFraction: 1,
            initialPage: _monthNow,
            onPageChanged: (
              index,
              reason,
            ) {
              if (reason == CarouselPageChangedReason.manual) {
                _changeMonth(index);
              }
            },
          ),
          itemBuilder: (
            BuildContext context,
            int index,
            int realIndex,
          ) {
            var monthInt = index + 1;
            return SlideWidget(month: monthInt);
          },
        ),
      ],
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.monthCurrent,
    required this.onChangeMonth,
  });

  final int monthCurrent;
  final Function(int) onChangeMonth;

  void _selectMonth(BuildContext context) async {
    var selectedMonth = await showSelectMonth(context);
    if (selectedMonth != null) onChangeMonth(selectedMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "График",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () => onChangeMonth(monthCurrent.moveLeftMonth),
          child: const SizedBox(
            width: 36,
            height: 36,
            child: Icon(Icons.keyboard_arrow_left),
          ),
        ),
        InkWell(
          onTap: () => _selectMonth(context),
          child: Container(
            width: 120,
            alignment: Alignment.center,
            child: Text(
              monthCurrent.toMonthYearString,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => onChangeMonth(monthCurrent.moveRightMonth),
          child: const SizedBox(
            width: 36,
            height: 36,
            child: Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ],
    );
  }
}