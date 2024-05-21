import 'package:application/firebase_options.dart';
import 'package:application/widgets/AppBlocs.dart';
import 'package:application/widgets/authentication/login.dart';
import 'package:application/widgets/homepage.dart';
import 'package:application/widgets/splash.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

var collection = FirebaseFirestore.instance
    .collection("${FirebaseAuth.instance.currentUser?.email}");

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent),
    );

    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => userProvider())],
      child: MaterialApp(
          debugShowMaterialGrid: false,
          title: 'Kaps Ai',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
          home: login()
          // StreamBuilder<User?>(
          //   stream: FirebaseAuth.instance.authStateChanges(),
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     if (snapshot.hasData) {
          //       return const HomePage();
          //     } else {
          //       return const OnBoardingPage();
          //     }
          //   },
          // ),
          ),
    );
  }
}
