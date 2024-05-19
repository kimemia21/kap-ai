// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:application/widgets/AppNavigations.dart';
import 'package:application/widgets/ChatBot.dart';
import 'package:application/widgets/Content.dart';
import 'package:application/widgets/firebaseAutions/FirebaseFunctions.dart';
import 'package:application/widgets/homepage.dart';
import 'package:application/widgets/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:typethis/typethis.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TypeThisController _controller = TypeThisController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool obsecure = true;

  Widget userTextField(
      {required icon,
      required TextEditingController controller,
      required String name}) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      margin: EdgeInsets.only(top: 3, bottom: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: name,
          border: InputBorder.none,
          hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          icon: icon,
        ),
      ),
    );
  }

  Widget PasswordTextField(
      {required icon,
      required TextEditingController controller,
      required String name}) {
    return Container(
      padding: EdgeInsets.only(left: 5),
      margin: EdgeInsets.only(top: 3, bottom: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(10)),
      child: TextFormField(
        obscureText: obsecure,
        controller: controller,
        decoration: InputDecoration(
          suffix: IconButton(
              onPressed: () {
                setState(() {
                  obsecure = !obsecure;
                });
              },
              icon: Icon(
                obsecure ? Icons.visibility_off : Icons.visibility,
                color: Colors.black54,
              )),
          hintText: name,
          border: InputBorder.none,
          hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
          icon: icon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.circular(20)),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnBoardingPage()));
              },
              icon: Icon(CupertinoIcons.back),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.blue.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.2, 6.5]),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sign in",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 38),
                            ),
                            Text(
                              "To Access your account",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400, fontSize: 18,color:Colors.black54),
                            )
                          ],
                        ),
                      ),
                      Container(
                          child: Image.asset(
                        "assets/images/login.webp",
                        fit: BoxFit.contain,
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.5,
                      ))
                    ],
                  ),
                  userTextField(
                      icon: Icon(
                        CupertinoIcons.person,
                        size: 22,
                      ),
                      controller: _userName,
                      name: "Username"),
                  PasswordTextField(
                      icon: Icon(
                        CupertinoIcons.padlock,
                        size: 22,
                      ),
                      controller: _password,
                      name: "Password"),
                  Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Sign in",
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "Or Sign in With",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Authentication.signInWithGoogle(context: context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 55,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(25)),
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/google.png"
                              ,
                              height: 35),
                          Text(
                            "oogle",
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
