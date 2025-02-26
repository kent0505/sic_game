import 'dart:developer' as developer;

import 'package:intl/intl.dart';

String formatNumber(double number) {
  return NumberFormat('#,###', "fr_FR").format(number);
}

void logger(Object message) => developer.log(message.toString());
