// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:application/widgets/AppNavigations.dart';
import 'package:application/widgets/ChatBot.dart';
import 'package:application/widgets/firebaseAutions/FirebaseFunctions.dart';
import 'package:application/widgets/homepage.dart';
import 'package:application/widgets/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/loginOne.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(4),
                  child: TypeThis(
                    string: 'Click the button below to Login With Google',
                    controller: _controller,
                    speed: 100,
                    style: GoogleFonts.vt323(fontSize: 18, color: Colors.black),
                    richTextMatchers: const [
                      TypeThisMatcher(
                        'Google',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          // decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                // Container(
                //   height: MediaQuery.of(context).size.height*0.2,
                //   width: MediaQuery.of(context).size.width,
                //   child: Image.asset("assets/gif/google.gif"),),
                GestureDetector(
                  onTap: () {
                    Authentication.signInWithGoogle(context: context);
                  },
                  child: Container(
                      // margin: EdgeInsets.only(),
                      alignment: Alignment.center,
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          // color: Colors.black54,
                          borderRadius: BorderRadiusDirectional.circular(5)),
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: "https://j.gifs.com/yoe67W.gif")

                      //  Image.network(
                      //     "https://miro.medium.com/freeze/fit/c/160/112/1*NyU8Hi9juxH7__nspK6erg.gif"),
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    {
                      Authentication.signInWithGoogle(context: context);
                    }
                    ;
                  },
                  child: Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      height: 40,
                      width: MediaQuery.of(context).size.width * 0.7,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      child: Text(
                        "Login",
                        style: GoogleFonts.vt323(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
