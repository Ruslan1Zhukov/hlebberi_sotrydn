import 'package:hlebberi_sotrydn/model/zp.dart';

class OneDay {
  final DateTime data;
  final String time;
  final String jobTitle;
  final String location;
  final Zp zp;

  OneDay({
    required this.data,
    required this.time,
    required this.jobTitle,
    required this.location,
    required this.zp,
  });

  bool isCurrent() {
    var now = DateTime.now();
    return now.year == data.year &&
        now.month == data.month &&
        now.day == data.day;
  }
}
