class DurationExtensions {
  static String formatTimeWithOptionalHour(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String time =
        '${twoDigits(duration.inMinutes.remainder(60))}:${twoDigits(duration.inSeconds.remainder(60))}';

    if (duration.inHours > 0) {
      time = '${twoDigits(duration.inHours)}:$time';
    }
    return time;
  }
}
