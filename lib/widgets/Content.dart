// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:application/widgets/ChatBot.dart';
import 'package:application/widgets/Gemini.dart';
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

Widget displayContent(
    {required icon, required String title, required Color? color}) {
  return Container(
    height: 20,
    padding: EdgeInsets.all(8),
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadiusDirectional.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: color,
        ),
        Container(
          margin: EdgeInsets.only(right: 5, left: 5),
          child: Text(
            title,
            style: GoogleFonts.poppins(),
          ),
        )
      ],
    ),
  );
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
              colors: [Colors.grey.shade200, Colors.blue.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 2.5]),
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
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(CupertinoIcons.photo_camera),
                            Icon(
                              Icons.mic,
                              color: Colors.black54,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children: [
                      displayContent(
                          icon: CupertinoIcons.pencil_ellipsis_rectangle,
                          title: "Gnnovation Ai ",
                          color: Colors.blue),
                      displayContent(
                          icon: CupertinoIcons.text_bubble_fill,
                          title: "ChatBot",
                          color: Colors.green.shade300),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GeminiAi()));
                          },
                          child: displayContent(
                              icon: CupertinoIcons.rocket,
                              title: "Gemini Ai",
                              color: Colors.black54)),
                      displayContent(
                          icon: CupertinoIcons.moon_circle_fill,
                          title: "About Us",
                          color: Colors.yellow.shade600),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, right: 5, left: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      Text(
                        "See All",
                        style: GoogleFonts.poppins(
                            color: Colors.blue, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("No Data Available"),
                      Container(
                        margin: EdgeInsets.only(),
                        child: AnimatedEmoji(
                          AnimatedEmojis.sad,
                          size: 50,
                          repeat: true,
                          // Force the emoji to be loaded from assets.
                          source: AnimatedEmojiSource.network,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
