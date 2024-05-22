import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:application/main.dart';
import 'package:application/widgets/SearchPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSearches extends StatefulWidget {
  const UserSearches({super.key});

  @override
  State<UserSearches> createState() => _UserSearchesState();
}

class _UserSearchesState extends State<UserSearches> {
  Query<Map<String, dynamic>> searchQueries = collection.limit(4);

  @override
  Widget build(BuildContext context) {
    void _showError(String message) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Something went wrong'),
            content: SingleChildScrollView(
              child: Text(message),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              )
            ],
          );
        },
      );
    }

    void _showDetails({required String title, required String subtitle}) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
            content: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Text(
                subtitle.toString().replaceAll("**", ""),
                style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        child: Text(
                          "Delete",
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade400,
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      child: Text(
                        'close',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        },
      );
    }

    return StreamBuilder(
      stream: searchQueries.snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasError) {
          _showError("${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('No data found.'));
        } else {
          List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
              snapshot.data!.docs;

          // List<String> keys = data.keys.toList();
          // List<dynamic> values = data.values.toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent",
                        style: GoogleFonts.abel(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                      TextButton(
                          onPressed: () {
                             Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return SearchPage();
                      }, transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(1.0, 0.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      }));
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.abel(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.blue,
                            ),
                          ))
                    ],
                  )),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: documents.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      Map<String, dynamic> data = documents[index].data();
                      String keys = data.keys.toList()[0];
                      String values = data.values.toList()[0];

                      return Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        height: 150,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        child: ListTile(
                          onLongPress: () => _showDetails(
                              title: keys.toString(),
                              subtitle: values.toString()),
                          // leading: I
                          //con(Icons.search,color: Colors.blue.shade300,),
                          title: Container(
                            margin: EdgeInsets.only(bottom: 2),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: Text(
                                    keys,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                // IconButton(onPressed: (){}, icon:Icon(Icons.more_vert)),
                              ],
                            ),
                          ),
                          subtitle: Text(
                            values.toString().replaceAll("**", ""),
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                          // trailing: IconButton(onPressed: (){}, icon:Icon(Icons.more_vert)),
                        ),
                      );
                    },
                  )),
            ],
          );
        }
      },
    );
  }
}
