import 'package:flutter/material.dart';

class Myprovider with ChangeNotifier
{
  int count = 0;
  void increment ()
  {
    count++;
    notifyListeners();
  }
}