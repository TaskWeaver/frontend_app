String intlFormatDate(DateTime date) {
  var year = date.year.toString();
  var month = date.month.toString().padLeft(2, '0');
  var day = date.day.toString().padLeft(2, '0');

  return '$year-$month-$day';
}
