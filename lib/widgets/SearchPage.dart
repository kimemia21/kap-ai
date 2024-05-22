// ignore_for_file: prefer_const_constructors

import 'package:application/main.dart';
import 'package:application/widgets/Errors.dart';
import 'package:application/widgets/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Query<Map<String, dynamic>> _query = collection;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                    return HomePage();
                  }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInCirc;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  }));
            },
            icon: Icon(Icons.arrow_back)),
        title: Text("Conversations",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            )),
        actions: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadiusDirectional.circular(20)),
              margin: EdgeInsets.all(10),
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(20),
                child: FirebaseAuth.instance.currentUser != null
                    ? Image.network(
                        "${FirebaseAuth.instance.currentUser!.photoURL}")
                    : Image.asset("  assets/images/pngtreetwo.png"),
              ))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.grey.shade300, Colors.blue.shade100],
        )),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(4),
                  width: MediaQuery.of(context).size.width * 0.35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(25),
                    color: Colors.blue.shade700,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle_rounded,
                            color: Colors.white,
                            size: 35,
                          )),
                      Text(
                        "New Chat",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: StreamBuilder(
                    stream: _query.snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        AppErrors.showError(
                            message: snapshot.error.toString(),
                            context: context);
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      List<QueryDocumentSnapshot<Map<String, dynamic>>>
                          document = snapshot.data!.docs;

                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            Map<String, dynamic> data = document[index].data();
                            String keys = data.keys.toList()[0];
                            String values = data.values.toList()[0];
                            return Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(20)),
                              child: ListTile(
                                title: Text(keys,style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,),
                                subtitle: Text(
                                  values.toString().replaceAll("**", ""),
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500),
                                  maxLines: 7,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                // trailing:PopupMenuButton()
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
