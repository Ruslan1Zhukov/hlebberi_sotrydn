const defaultWidthMin = 50.0;

double systemPlot({
  double x = defaultWidthMin,
  required double widthScreen,
  required double count,
  required int value,
  required double sum,
}) {
  if (sum == 0) return x;
  return x + (widthScreen - count * x) * value / sum;
}
