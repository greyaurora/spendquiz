import 'package:flutter/material.dart';

enum DateRange { today, yesterday, week, month }

Text rangeLabel(DateRange range) {
  String label;

  switch (range) {
    case DateRange.today:
      label = 'Today!';
      break;
    case DateRange.yesterday:
      label = 'Yesterday!';
      break;
    case DateRange.week:
      label = 'This week!';
      break;
    case DateRange.month:
      label = 'This month!';
      break;
  }

  return Text(
    label,
    style: TextStyle(
      color: Colors.white,
      fontSize: 24,
    ),
  );
}

List<int> ranges(DateRange range) {
  int start, end;
  DateTime date = DateTime.now();

  date = date.subtract(Duration(
    hours: date.hour,
    minutes: date.minute,
    seconds: date.second,
  ));

  switch (range) {
    case DateRange.yesterday:
      start = date.subtract(Duration(days: 1)).millisecondsSinceEpoch;
      end = date.millisecondsSinceEpoch;
      break;
    case DateRange.week:
      start = date.subtract(Duration(days: 7)).millisecondsSinceEpoch;
      end = date.add(Duration(days: 1)).millisecondsSinceEpoch;
      break;
    case DateRange.month:
      start = date.subtract(Duration(days: 30)).millisecondsSinceEpoch;
      end = date.add(Duration(days: 1)).millisecondsSinceEpoch;
      break;
    case DateRange.today:
    default:
      start = date.millisecondsSinceEpoch;
      end = date.add(Duration(days: 1)).millisecondsSinceEpoch;
      break;
  }

  return [start, end];
}
