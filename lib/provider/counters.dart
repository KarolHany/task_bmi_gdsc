import 'package:flutter/material.dart';
import 'package:task_bmi_gdsc/models/result_info.dart';

class Counters extends ChangeNotifier {
  int WEIGHT = 40;
  int AGE = 10;
  double HEIGHT = 180;
  bool isMale = false;
  String gender = '';

  void incrementCounterWeight() {
    WEIGHT++;
    notifyListeners();
  }

  void decrementCounterWeight() {
    WEIGHT--;
    notifyListeners();
  }

  void incrementCounterAge() {
    AGE++;
    notifyListeners();
  }

  void decrementCounterAge() {
    AGE--;
    notifyListeners();
  }


  double get sliderValue => HEIGHT;

  set sliderValue(double value) {
    HEIGHT = value;
    notifyListeners();
  }

  bool get isMaleBool => isMale;
  String get genderKind => gender;

  void setMale() {
    isMale = true;
    gender = 'male';
    notifyListeners();
  }

  void setFemale() {
    isMale = false;
    gender = 'female';
    notifyListeners();
  }
}
