import 'package:animated_emoji/emoji.dart';
import 'package:animated_emoji/emojis.g.dart';
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
    return Column(children: [
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
    ],);
  }
}