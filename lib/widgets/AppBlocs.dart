import 'package:flutter/foundation.dart';

class userProvider extends ChangeNotifier {
  bool showGemini = false;
  String ai_response = "";

  void changeshowGemini({required bool show}) {
    showGemini = show;
    notifyListeners();
  }

  void changeResponse({required response}) {
    ai_response = response;
    notifyListeners();
  }
}
