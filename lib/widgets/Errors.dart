import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppErrors {

  static void showError({ required String message, required BuildContext context}) {
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


