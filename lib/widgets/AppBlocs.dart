import 'package:flutter/foundation.dart';

class userProvider extends ChangeNotifier {
  bool showGemini = false;

  void changeshowGemini({required bool show}) {
    showGemini = show;
    notifyListeners();
  }
}
