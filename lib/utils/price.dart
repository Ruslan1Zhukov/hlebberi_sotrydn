import 'package:intl/intl.dart';

extension Price on int {
  String toPriceString() {
    if (this < 10000) {
      return toString();
    }
    final numberFormat = NumberFormat('#,###', 'ru_RU');
    return numberFormat.format(this);
  }
}