import 'package:application/widgets/authentication/login.dart';
import 'package:flutter/material.dart';


class Navigation {

  static void  onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const login()),
    );
  }
  
}








