import 'package:intl/intl.dart';

String getDataExtensa(DateTime date) {
  final formatter = DateFormat("EEEE, d 'de' MMMM", 'pt_BR');

  String formatedDate = formatter.format((date));

  return formatedDate;
}
