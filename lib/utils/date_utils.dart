import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String getDataExtensa(DateTime date) {
    final formatter = DateFormat("EEEE, d 'de' MMMM", 'pt_BR');

    String formatedDate = formatter.format((date));

    return formatedDate;
  }
}
