// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:application/widgets/ChatBot.dart';
import 'package:application/widgets/comingSoon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "How may I help \nyou today?",
                    style: GoogleFonts.roboto(fontSize: 34),
                  )),
              SizedBox(
                height: 220,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatBotScreen())),
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 200,
                        width: MediaQuery.of(context).size.width*0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10),
                            color: Colors.lightGreen.shade400),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.message_rounded),
                                      Icon(Icons.arrow_circle_right_rounded)
                                    ])),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Talk \nWith a Bot",
                                  style: GoogleFonts.abel(
                                      fontSize: 34,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ComingSoon()));},
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              height: 100,
                              width: 170,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10),
                                  color: Colors.indigo.shade200),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      margin: EdgeInsets.all(5),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.messenger_outline_sharp),
                                            Icon(
                                              Icons.arrow_circle_right_rounded,
                                              size: 25,
                                            )
                                          ])),
                                  Container(
                                      margin: EdgeInsets.all(5),
                                      child: Text(
                                        "Chat With Ai",
                                        style: GoogleFonts.abel(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ))
                                ],
                              ),
                            ),
                            GestureDetector(
                                 onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ComingSoon()));
                                    },
                              child: Container(
                                margin: EdgeInsets.only(left: 5, top: 5),
                                height: 100,
                                width: 170,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                    color: Colors.pink.shade100),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Icon(Icons.search),
                                              Icon(
                                                Icons.arrow_circle_right_rounded,
                                                size: 25,
                                              )
                                            ])),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        child: Text(
                                          "Serach  With Ai",
                                          style: GoogleFonts.abel(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
