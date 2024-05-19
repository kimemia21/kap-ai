// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:application/widgets/AppNavigations.dart';
import 'package:application/widgets/ChatBot.dart';
import 'package:application/widgets/firebaseAutions/FirebaseFunctions.dart';
import 'package:application/widgets/homepage.dart';
import 'package:application/widgets/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
                                  fontWeight: FontWeight.w300, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                      Container(
                          child: Image.network(
                        "https://cdn3d.iconscout.com/3d/premium/thumb/chat-bot-5379962-4497578.png?f=webp",
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
                    height: 65,
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
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      "Or Sign in With",
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 65,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(25)),
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                
                      children: [
                        Image.network(
                            "https://ouch-cdn2.icons8.com/VGHyfDgzIiyEwg3RIll1nYupfj653vnEPRLr0AeoJ8g/rs:fit:456:456/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9wbmcvODg2/LzRjNzU2YThjLTQx/MjgtNGZlZS04MDNl/LTAwMTM0YzEwOTMy/Ny5wbmc.png",
                            height: 50),
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
                ],
              ),
            ),
          ),
        ));
  }
}
