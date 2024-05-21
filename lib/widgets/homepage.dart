import 'package:application/widgets/Content.dart';
import 'package:application/widgets/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gnovation ai',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  MyHomePage(title: 'Gnovation Ai'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isOpened = false;

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  final GlobalKey<SideMenuState> _endSideMenuKey = GlobalKey<SideMenuState>();

  toggleMenu([bool end = false]) {
    if (end) {
      final _state = _endSideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    } else {
      final _state = _sideMenuKey.currentState!;
      if (_state.isOpened) {
        _state.closeSideMenu();
      } else {
        _state.openSideMenu();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      closeIcon: Icon(
        Icons.close,
        color: Colors.black,
      ),
      background: Colors.grey.shade200,
      key: _sideMenuKey,
      menu: buildMenu(),
      type: SideMenuType.shrinkNSlide,
      onChange: (_isOpened) {
        setState(() => isOpened = _isOpened);
      },
      child: IgnorePointer(
        ignoring: isOpened,
        child: Scaffold(
          
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
          
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.menu_outlined),
              onPressed: () => toggleMenu(),
            ),
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
                    child:FirebaseAuth.instance.currentUser!=null?
                    Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"):
                     Image.asset("  assets/images/pngtreetwo.png"),
                  ))
            ],
            title: Text(widget.title,style: GoogleFonts.roboto(fontWeight:FontWeight.bold),),
          ),
          body:
           Container(child: Display_Content())
        ),
      ),
    );
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadiusDirectional.circular(20)),
                  margin: EdgeInsets.all(10),
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    child:FirebaseAuth.instance.currentUser!=null?
                    Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"):
                     Image.asset("  assets/images/pngtreetwo.png"),
                  )),
                SizedBox(height: 16.0),
                Text(
                  "Hello, ${FirebaseAuth.instance.currentUser!.displayName}",
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(CupertinoIcons.home,
                size: 20.0, color: Colors.black),
            title: Text("Home",
                style: GoogleFonts.vt323(
                    color: Colors.black, fontWeight: FontWeight.normal)),
            textColor: Colors.black,
            dense: true,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(CupertinoIcons.person_fill,
                size: 20.0, color: Colors.black),
            title: Text("Profile",
                style: GoogleFonts.vt323(
                    color: Colors.black, fontWeight: FontWeight.normal)),
            textColor: Colors.black,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(CupertinoIcons.gear_alt_fill,
                size: 20.0, color: Colors.black),
            title: Text("Settings",style: GoogleFonts.vt323(
                    color: Colors.black, fontWeight: FontWeight.normal)),
            textColor: Colors.black,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.logout, size: 20.0, color: Colors.black),
            title:  Text("Log Out",style: GoogleFonts.vt323(
                    color: Colors.black, fontWeight: FontWeight.normal)),
            textColor: Colors.black,
            dense: true,

            // padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}



// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   void _onBackToIntro(context) {
//     Navigator.push(context, MaterialPageRoute(builder: (context)=> OnBoardingPage()));
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           leading: IconButton(
//             onPressed: () => _onBackToIntro(context),
//             icon: Icon(CupertinoIcons.back),
//           ),
//         ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text("This is the screen after Introduction"),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () => _onBackToIntro(context),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text("Log Out"),
//                   // ClipRRect(
//                   //     borderRadius: BorderRadiusDirectional.circular(20),
//                   //     child: Image.network(
//                   //         "${FirebaseAuth.instance.currentUser!.photoURL}")),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }