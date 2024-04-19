import 'package:application/widgets/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> OnBoardingPage()));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            onPressed: () => _onBackToIntro(context),
            icon: Icon(CupertinoIcons.back),
          ),
        ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Home page"),
                  // ClipRRect(
                  //     borderRadius: BorderRadiusDirectional.circular(20),
                  //     child: Image.network(
                  //         "${FirebaseAuth.instance.currentUser!.photoURL}")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
