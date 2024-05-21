import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
import 'package:application/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserSearches extends StatefulWidget {
  const UserSearches({super.key});

  @override
  State<UserSearches> createState() => _UserSearchesState();
}

class _UserSearchesState extends State<UserSearches> {
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

    return StreamBuilder(
      stream: collection.snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          _showError("${snapshot.error}");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          DocumentSnapshot document = snapshot.data!.docs;
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          List<String> keys = data.keys.toList();
          List<dynamic> values = data.values.toList();

          return Expanded(
            child: ListView.builder(
              itemCount: keys.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(keys[index].toString()),
                  subtitle: Text(values[index].toString()),
                );
              },
            ),
          );
        }
      },
    );

    // Column(
    //   children: [
    //     Container(
    //       margin: EdgeInsets.only(top: 20, right: 5, left: 5),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text(
    //             "Recent",
    //             style: GoogleFonts.poppins(
    //                 fontWeight: FontWeight.w600, fontSize: 20),
    //           ),
    //           Text(
    //             "See All",
    //             style: GoogleFonts.poppins(
    //                 color: Colors.blue, fontWeight: FontWeight.w400),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Container(
    //       margin: EdgeInsets.only(top: 100),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Text("No Data Available"),
    //           Container(
    //             margin: EdgeInsets.only(),
    //             child: AnimatedEmoji(
    //               AnimatedEmojis.sad,
    //               size: 50,
    //               repeat: true,
    //               // Force the emoji to be loaded from assets.
    //               source: AnimatedEmojiSource.network,
    //             ),
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}
