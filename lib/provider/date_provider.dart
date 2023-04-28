import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DateProvider extends ChangeNotifier
{
  DateTime curday=DateTime.now();
  DateTime seliday=DateTime.now();
  void pDate(DateTime cdate)
  {
    seliday=cdate;
    notifyListeners();
  }
  TimeOfDay current=TimeOfDay.now();
  TimeOfDay selitime=TimeOfDay.now();
  void ptime(TimeOfDay ctime)
  {
    selitime=ctime;
    notifyListeners();
  }
}