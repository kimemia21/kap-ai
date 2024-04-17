// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Text("Login Screen"),),
          Container(
            height: MediaQuery.of(context).size.height*0.4,
            width: MediaQuery.of(context).size.width,
            child: Image.network("https://cdn.dribbble.com/users/87229/screenshots/2621232/google_tamaskojo.gif"),)
          
        
      
      
      
      ],),
    ),);
  }
}
