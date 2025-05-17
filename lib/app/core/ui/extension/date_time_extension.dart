extension DateTimeExtension on DateTime {
  String get appTimeFormat {
    return "${hour}h$minute";
  }

  DateTime fillHourAndMinute(int hour, int minute) {
    return DateTime(year, month, day, hour, minute);
  }
}
