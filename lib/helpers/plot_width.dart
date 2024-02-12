const defaultWidthMin = 50.0; // минимальная ширина единицы графика

double systemPlot({
  double x = defaultWidthMin,
  required double widthScreen,
  required double count,
  required int value,
  required double sum,
}) {
  return x + (widthScreen - count * x) * value / sum;
}
