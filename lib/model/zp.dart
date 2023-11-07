import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/helpers/plot_width.dart';

class Zp {
  final int sum;
  List<PlotItem> items;

  Zp({
    required this.sum,
    required this.items,
  });

  double sumDouble(){
    double sum = 0;
    for (var element in items) {
      sum += element.value;
    }
    return sum;
  }
}

class PlotItem {
  final String name;
  final Color color;
  final int value;

  PlotItem({
    required this.name,
    required this.color,
    required this.value,
  });

  double getFlex({
    double x = 50,
    required double widthScreen,
    required double count,
    required double sum,
  }) {
    return systemPlot(
      x: x,
      widthScreen: widthScreen,
      count: count,
      value: value.toDouble(),
      sum: sum,
    );
  }
}
