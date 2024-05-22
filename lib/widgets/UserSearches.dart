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
  Query<Map<String, dynamic>> searchQueries = collection;

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

          return 
          Container(
            margin: EdgeInsets.only(top:10),
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
                  String values= data.values.toList()[0];
                  
          
                  return 
                  
                  Container(
                    width: MediaQuery.of(context).size.width*0.3,
                    height: 200,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(color:Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(10)),
                    child: ListTile(
                 
                      
                      // leading: I
                      //con(Icons.search,color: Colors.blue.shade300,),
                      title: Container(
                        margin: EdgeInsets.only(bottom:2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              Icon(Icons.search,color: Colors.blue.shade300,),
                            
                            Text(keys,style: GoogleFonts.poppins(fontWeight:FontWeight.w500),overflow: TextOverflow.ellipsis,maxLines: 1,),
                            // IconButton(onPressed: (){}, icon:Icon(Icons.more_vert)),
                          ],
                        ),
                      ),
                    subtitle: Text(values.toString().replaceAll("**",""),style: GoogleFonts.poppins(fontWeight:FontWeight.w300),
                    maxLines:6 ,
                     overflow: TextOverflow.fade,),
                    // trailing: IconButton(onPressed: (){}, icon:Icon(Icons.more_vert)),
                    ),
                  );
                },
              )
             
              );
        }
      },
    );


  }
}
