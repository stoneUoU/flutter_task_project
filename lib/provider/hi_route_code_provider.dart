import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HiRouteCodeProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _clickNum = 0;
  bool _isOn = false;

  int get clickNum => _clickNum;
  bool get isOn => _isOn;

  void setClickNum(int clickNum) {
    _clickNum = clickNum;
    notifyListeners();
  }

  void setIsOn(bool isOn) {
    _isOn = isOn;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('clickNum', clickNum));
    properties.add(FlagProperty("isOn", value: isOn));
  }
}