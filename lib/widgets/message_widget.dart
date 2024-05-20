import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MessageWidget extends StatelessWidget {
  final String text;
  final bool isFromUser;
  const MessageWidget(
      {super.key, required this.text, required this.isFromUser});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Flexible(child: Container(
        constraints: BoxConstraints(maxWidth: 520),
        decoration: BoxDecoration(
          color: isFromUser?Colors.blue:Colors.red,
          borderRadius: BorderRadiusDirectional.circular(18)


        ),
        child:Column(children: [
          Markdown(data: text)
        ],)
      ))],
    );
  }
}
