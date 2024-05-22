// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:application/main.dart';
import 'package:application/widgets/AppBlocs.dart';
import 'package:application/widgets/Homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';
import 'package:typethis/typethis.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Display_Gemini extends StatefulWidget {
  const Display_Gemini({super.key});

  @override
  State<Display_Gemini> createState() => _Display_GeminiState();
}

class _Display_GeminiState extends State<Display_Gemini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(pageBuilder:
                          (context, animation, secondaryAnimation) {
                        return HomePage();
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
                  context.read<userProvider>().changeshowGemini(show: false);
                  context.read<userProvider>().changeWelcomed();
                },
                icon: Icon(Icons.arrow_back)),
            centerTitle: true,
            title: TypeThis(
                speed: 100,
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                string: "Google Gemini")),
        body: context.watch<userProvider>().showGemini
            ? ChatWidget(apiKey: "AIzaSyAWqsNi7g2ed05UKvVGzkx95mrNv9imA4A")
            : Welcome_Gemini());
  }
}

class Welcome_Gemini extends StatefulWidget {
  const Welcome_Gemini({super.key});

  @override
  State<Welcome_Gemini> createState() => _Welcome_GeminiState();
}

class _Welcome_GeminiState extends State<Welcome_Gemini> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.blue.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2, 6.5]),
        ),
        padding: EdgeInsets.all(8.0),
        child: Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topRight,
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/gif/bot.gif"),
                          fit: BoxFit.contain)),
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)),
                          color: Colors.blueAccent),
                      child: Text("World")
  //                     BubbleSpecialThree(
  // text: "Hey, ${FirebaseAuth.instance.currentUser?.displayName}",
  // color: Color(0xFF1B97F3),
  // tail: true,
  // textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
  //   fontSize: 16
  // ),


                      
                      
                      
                      // Text(
                      //   "Hey, ${FirebaseAuth.instance.currentUser?.displayName}",
                      //   style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                      // ),
                    ),
              
                  ),
                ),
                Container(
                  child: Text(
                    context.watch<userProvider>().isWelcomed
                        ?"Welcome Back"
                        : "",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        fontSize: 18),
                  ),
                ),
                Container(
                  child: Text(
                    "How Can i Help You Today?",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                        fontSize: 20),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<userProvider>().changeshowGemini(show: true);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 10),
                    padding:
                        EdgeInsets.only(top: 1, right: 20, left: 20, bottom: 1),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusDirectional.circular(20)),
                    child: Icon(
                      CupertinoIcons.keyboard_chevron_compact_down,
                      color: Colors.blue,
                      size: 50,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({required this.apiKey, super.key});

  final String apiKey;

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode(debugLabel: 'TextField');
  bool _loading = false;
  bool _chatStared = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: widget.apiKey,
    );
    _chat = _model.startChat();
  }

  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final history = _chat.history.toList();

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 6.5]),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              itemBuilder: (context, idx) {
                final content = history[idx];
                final text = content.parts
                    .whereType<TextPart>()
                    .map<String>((e) => e.text)
                    .join('');
                return MessageWidget(
                  text: text,
                  isFromUser: content.role == 'user',
                );
              },
              itemCount: history.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    focusNode: _textFieldFocus,
                    decoration:
                        textFieldDecoration(context, 'Enter a prompt...'),
                    controller: _textController,
                    onSubmitted: (String value) {
                      if (_textController.text.isNotEmpty) {
                        _sendChatMessage(value);
                      }
                    },
                  ),
                ),
                const SizedBox.square(dimension: 15),
                if (!_loading)
                  IconButton(
                    onPressed: () async {
                      _sendChatMessage(_textController.text);
                    },
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                else
                  const CircularProgressIndicator(),
              ],
            ),
          ),
        ],
      ),
    );
    // Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //         colors: [Colors.white, Colors.blue.shade100],
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //         stops: [0.2, 6.5]),
    //   ),
    //   padding: const EdgeInsets.all(8.0),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Expanded(
    //         child: ListView.builder(
    //           physics: BouncingScrollPhysics(),
    //           controller: _scrollController,
    //           itemBuilder: (context, idx) {
    //             final content = history[idx];
    //             final text = content.parts
    //                 .whereType<TextPart>()
    //                 .map<String>((e) => e.text)
    //                 .join('');
    //             return MessageWidget(
    //               text: text,
    //               isFromUser: content.role == 'user',
    //             );
    //           },
    //           itemCount: history.length,
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(
    //           vertical: 25,
    //           horizontal: 15,
    //         ),
    //         child: Row(
    //           children: [
    //             Expanded(
    //               child: TextField(
    //                 autofocus: true,
    //                 focusNode: _textFieldFocus,
    //                 decoration:
    //                     textFieldDecoration(context, 'Enter a prompt...'),
    //                 controller: _textController,
    //                 onSubmitted: (String value) {
    //                   _sendChatMessage(value);
    //                 },
    //               ),
    //             ),
    //             const SizedBox.square(dimension: 15),
    //             if (!_loading)
    //               IconButton(
    //                 onPressed: () async {
    //                   _sendChatMessage(_textController.text);
    //                 },
    //                 icon: Icon(
    //                   Icons.send,
    //                   color: Theme.of(context).colorScheme.primary,
    //                 ),
    //               )
    //             else
    //               const CircularProgressIndicator(),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Future<void> _sendChatMessage(String message) async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await _chat.sendMessage(
        Content.text(message),
      );

      final text = response.text;

      // Use context.read to update the provider without listening
      context.read<userProvider>().changeResponse(response: text);

      final id = DateTime.now().microsecondsSinceEpoch.toString();

      // Use context.read to access the provider's value without listening
      final aiResponse = context.read<userProvider>().ai_response;

      collection.doc(id).set({
        "createdOn": FieldValue.serverTimestamp(),

        message.toString(): aiResponse.toString(), // Fix key-value assignment
      });
      print(aiResponse);

      if (text == null) {
        _showError('Empty response.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      print(e);
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();

      setState(() {
        _loading = false;
      });
      _textFieldFocus.requestFocus();
    }
  }

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
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.text,
    required this.isFromUser,
  });

  final String text;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            decoration: BoxDecoration(
              color: isFromUser
                  ? Theme.of(context).colorScheme.onError
                  : Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            margin: const EdgeInsets.only(bottom: 8),
            child: MarkdownBody(data: text),
          ),
        ),
      ],
    );
  }
}

InputDecoration textFieldDecoration(BuildContext context, String hintText) =>
    InputDecoration(
      contentPadding: const EdgeInsets.all(15),
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(14),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
