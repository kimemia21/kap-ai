import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class userProvider extends ChangeNotifier {
  bool showGemini = false;
  String ai_response = "";
  bool isWelcomed = false;

  void changeshowGemini({required bool show}) {
    showGemini = show;
    notifyListeners();
  }

  void changeResponse({required response}) {
    ai_response = response;
    notifyListeners();
  }

  void changeWelcomed() {
    isWelcomed = true;
    notifyListeners();
  }
}






