// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:application/widgets/AppNavigations.dart';
import 'package:application/widgets/firebaseAutions/FirebaseFunctions.dart';
import 'package:application/widgets/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>Navigation.onIntroEnd(context) ,
            icon: Icon(CupertinoIcons.back),
          ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
    
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.4,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/gif/loginOne.gif",fit: BoxFit.cover,),

              ),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Login With Google",
                  style: GoogleFonts.brunoAce(
                      fontSize: 18, fontWeight: FontWeight.bold),
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
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(5)),
                    child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image:
                            "https://miro.medium.com/freeze/fit/c/160/112/1*NyU8Hi9juxH7__nspK6erg.gif")

                    //  Image.network(
                    //     "https://miro.medium.com/freeze/fit/c/160/112/1*NyU8Hi9juxH7__nspK6erg.gif"),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
