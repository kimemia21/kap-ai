// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:application/widgets/ChatBot.dart';
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
                    "How may i help \nyou today?",
                    style: GoogleFonts.vt323(fontSize: 34),
                  )),
              Container(
                height: 220,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: Colors.grey.shade300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: ()=>Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ChatBotScreen())),
      
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10),
                            color: Colors.lightGreen.shade200),
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
                                      Icon(Icons.search_sharp),
                                      Icon(Icons.arrow_circle_right_rounded)
                                    ])),
                            Container(
                                margin: EdgeInsets.all(5),
                                child: Text(
                                  "Talk \nWith a Bot",
                                  style: GoogleFonts.vt323(
                                      fontSize: 34, fontWeight: FontWeight.w500),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Container(
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
                                          Icon(Icons.message),
                                          Icon(
                                            Icons.arrow_circle_right_rounded,
                                            size: 25,
                                          )
                                        ])),
                                Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      "Chat With Ai",
                                      style: GoogleFonts.vt323(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ))
                              ],
                            ),
                          ),
                          Container(
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
                                          Icon(Icons.message_sharp),
                                          Icon(
                                            Icons.arrow_circle_right_rounded,
                                            size: 25,
                                          )
                                        ])),
                                Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      "Serach  With Ai",
                                      style: GoogleFonts.vt323(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400),
                                    ))
                              ],
                            ),
                          ),
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
                        Text("History",
                            style: GoogleFonts.vt323(
                                fontSize: 32,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
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
    child:ListTile(
      leading: Icon(Icons.earbuds),
      title: Text("we are testing this data",style: GoogleFonts.vt323(
                    color: Colors.black, fontWeight: FontWeight.normal)),
                    trailing: Icon(Icons.more_vert),
                  
    ) ,
  );
}
