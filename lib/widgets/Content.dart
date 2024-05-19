// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:application/widgets/ChatBot.dart';
import 'package:application/widgets/comingSoon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class content extends StatefulWidget {
  const content({super.key});

  @override
  State<content> createState() => _contentState();
}

class _contentState extends State<content> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(8),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(5),
          gradient: LinearGradient(
              colors: [Colors.grey.shade200, Colors.blue.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [2.2, 0.8]),
        ),
        child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: ClipRRect(
                    child: Image.asset("assets/images/UserHolder.png"),
                    borderRadius: BorderRadiusDirectional.circular(20),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Welcome to",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 28),
                    )),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Gnnovation Ai",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600, fontSize: 24),
                    )),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadiusDirectional.circular(25)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        padding: EdgeInsets.only(left: 12),
                       
                        child: Text(
                          "Ask me anything...",
                          style: GoogleFonts.poppins(
                            fontWeight:FontWeight.w400,
                            color:Colors.black54,
                            fontSize:18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10,left: 10),
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(CupertinoIcons.photo_camera),
                            Icon(Icons.mic,color: Colors.black54,)
                          
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width * 1,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: Colors.grey.shade300),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            child: Text("History",
                                style: GoogleFonts.abel(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      firebaseHistory(),
                      firebaseHistory(),
                      firebaseHistory(),
                      firebaseHistory(),
                      firebaseHistory(),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}

Widget firebaseHistory(

    // {required context, required info}
    ) {
  return Container(
    margin: EdgeInsets.only(bottom: 5),
    decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadiusDirectional.circular(10)),
    child: ListTile(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      leading: Icon(CupertinoIcons.news),
      title: Text("We are testing this data",
          style: GoogleFonts.abel(
              color: Colors.black, fontWeight: FontWeight.bold)),
      trailing: Icon(Icons.more_vert),
    ),
  );
}
