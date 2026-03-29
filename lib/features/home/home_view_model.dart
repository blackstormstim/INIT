import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  bool isRunning = false;
  double stressLevel = 0.2;

  Timer? _timer;

  void start() {
    isRunning = true;

    _timer = Timer.periodic(Duration(seconds: 2), (_) {
      stressLevel = Random().nextDouble(); // simulation
      notifyListeners();
    });

    notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    isRunning = false;
    notifyListeners();
  }

  Color get stressColor {
    if (stressLevel < 0.4) return Colors.green;
    if (stressLevel < 0.7) return Colors.orange;
    return Colors.red;
  }

  String get stressText {
    if (stressLevel < 0.4) return "Stress faible";
    if (stressLevel < 0.7) return "Stress modéré";
    return "Stress élevé";
  }
}
