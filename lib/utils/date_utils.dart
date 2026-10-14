import 'package:intl/intl.dart';

class DateTimeUtils {
  DateTimeUtils._();

  static String getDataExtensa(DateTime date) {
    final formatter = DateFormat("EEEE, d 'de' MMMM", 'pt_BR');

    String formatedDate = formatter.format((date));

    return formatedDate;
  }

  static String getSaudacao(DateTime? date) {
    date = date ?? DateTime.now();

    if (date.hour >= 5 && date.hour < 12) {
      return 'Bom dia';
    } else if (date.hour > 12 && date.hour < 18) {
      return 'Boa tarde';
    } else {
      return 'Boa noite';
    }
  }
}
