import 'package:flutter/widgets.dart';

class SliderClass extends ChangeNotifier {
  double value = 1.0;
  void callSlider(double val) {
    // print("call");
    value = val;
    notifyListeners();
  }
}
