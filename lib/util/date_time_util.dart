import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtil {
  static final DateTimeUtil _singleton = DateTimeUtil();

  static DateTimeUtil get instance => _singleton;

  bool checkIfTimeStampIsExpired(int expireTimeStampInSeconds) {
    int currentTimeStamp = _getCurrentTimeStampInSeconds();
    return currentTimeStamp >= expireTimeStampInSeconds;
  }

  int getExpireTimeStamp(int periodInSeconds) {
    int currentTimeStamp = _getCurrentTimeStampInSeconds();
    int expireTimeStamp = currentTimeStamp + periodInSeconds - 24 * 60 * 60;
    return expireTimeStamp;
  }

  int _getCurrentTimeStampInSeconds() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }

  static String getMonthString(BuildContext context, DateTime date) {
    String languageCode = Localizations.localeOf(context).toLanguageTag();
    return DateFormat.MMM(languageCode).format(date);
  }
}
