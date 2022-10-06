import 'package:intl/intl.dart';

final dateFormat = DateFormat('yyyy-MM-dd');
final dateFormat2 = DateFormat('dd MMMM');

String getFormatedDate(DateTime date) {
  final currentDate = DateTime.now();
  if (dateFormat2.format(date) == dateFormat2.format(currentDate)) {
    return 'TODAY';
  }
  if (dateFormat2.format(date) ==
      dateFormat2.format(
          DateTime(currentDate.year, currentDate.month, currentDate.day - 1))) {
    return 'YESTERDAY';
  }
  return dateFormat2.format(date);
}
