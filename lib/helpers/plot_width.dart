double systemPlot({
  required double x,
  required double widthScreen,
  required double count,
  required double value,
  required double sum,
}) {
  return x + (widthScreen - count * x) * value / sum;
}
