import 'dart:math';
import 'package:hlebberi_sotrydn/model/one_day.dart';
import 'package:hlebberi_sotrydn/model/zp.dart';
import 'package:hlebberi_sotrydn/theme/fil_color.dart';

final Map<int, Zp> testPlotData = {
  1: generateZpMonth(),
  2: generateZpMonth(),
  3: generateZpMonth(),
  4: generateZpMonth(),
};

OneDay testOneDay(DateTime dateTime) => OneDay(
      data: dateTime,
      time: "05:03 - 16:10",
      jobTitle: "Пекарь",
      location: "г. Саранск, ул. Пролетарская, 103",
      zp: generateZpDay(),
    );

Zp generateZpMonth() {
  var value1 = _generateNumber(12000, 1000);
  var value2 = _generateNumber(5000, 500);
  var value3 = _generateNumber(2000, 200);
  var value4 = _generateNumber(500, 100);
  var value5 = _generateNumber(500, 100);
  var sum = value1 + value2 + value3 + value4 + value5 ;
  return Zp(
    sum: sum,
    items: [
      PlotItem(
        name: "Оклад",
        color: ColorProject.orange,
        value: value1,
      ),
      PlotItem(
        name: 'Премия(месяц)',
        color: ColorProject.pink,
        value: value2,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: ColorProject.lightBlue,
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: ColorProject.blue,
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.grayDiagram,
        value: value5,
      ),
    ],
  );
}

Zp generateZpDay() {
  var value1 = _generateNumber(1000, 100);
  var value3 = _generateNumber(600, 50);
  var value4 = _generateNumber(200, 50);
  var value5 = _generateNumber(100, 30);
  var sum = value1 + value3 + value4 - value5;
  return Zp(
    sum: sum,
    items: [
      PlotItem(
        name: "Оклад",
        color: ColorProject.orange,
        value: value1,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: ColorProject.lightBlue,
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: ColorProject.blue,
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.grayDiagram,
        value: value5,
      ),
    ],
  );
}

Zp generateZp() {
  var value1 = _generateNumber(1000, 100);
  var value3 = _generateNumber(600, 50);
  var value4 = _generateNumber(200, 50);
  var value5 = _generateNumber(100, 30);
  var sum = value1 + value3 + value4 - value5;
  return Zp(
    sum: sum,
    items: [
      PlotItem(
        name: "Оклад",
        color: ColorProject.orange,
        value: value1,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: ColorProject.lightBlue,
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: ColorProject.blue,
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.grayDiagram,
        value: value5,
      ),
    ],
  );
}


Zp generateZpMonthDi() {
  var value1 = _generateNumber(12000, 1000);
  var value2 = _generateNumber(5000, 500);
  var value3 = _generateNumber(2000, 200);
  var value4 = _generateNumber(500, 100);
  var value5 = _generateNumber(500, 100);
  var value6 = _generateNumber(500, 100);
  var value7 = _generateNumber(500, 100);
  var value8 = _generateNumber(500, 100);
  var sum = value1 + value2 + value3 + value4 + value5 + value6 + value7 + value8;
  return Zp(
    sum: sum,
    items: [
      PlotItem(
        name: "Оклад",
        color: ColorProject.orange,
        value: value1,
      ),
      PlotItem(
        name: 'Премия(месяц)',
        color: ColorProject.pink,
        value: value2,
      ),
      PlotItem(
        name: 'Премия(день)',
        color: ColorProject.lightBlue,
        value: value3,
      ),
      PlotItem(
        name: 'Процент с продаж',
        color: ColorProject.blue,
        value: value4,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.red,
        value: value5,
      ),
      PlotItem(
        name: '',
        color: ColorProject.blue,
        value: value5,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.lightBlue,
        value: value5,
      ),
      PlotItem(
        name: 'Демотивация',
        color: ColorProject.green,
        value: value5,
      ),
    ],
  );
}


int _generateNumber(int min, int range) {
  return min + Random().nextInt(range);
}
