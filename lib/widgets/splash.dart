// ignore_for_file: prefer_const_constructors
import 'package:application/widgets/authentication/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';


// "https://pngimg.com/d/robot_PNG40.png",

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const login()),
    );
  }

  // Widget _buildFullscreenImage() {
  //   return Image.network(
  //     "https://static.vecteezy.com/system/resources/previews/023/982/122/non_2x/friendly-cute-cartoon-robot-created-with-generative-ai-png.png",
  //     fit: BoxFit.cover,
  //     height: double.infinity,
  //     width: double.infinity,
  //     alignment: Alignment.center,
  //   );
  // }

  Widget _buildImage(String networkImage, [double width = 350]) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Image.network(networkImage, width: width,));
  }

  @override
  Widget build(BuildContext context) {
    
    final pageDecoration = PageDecoration(
      imageFlex: 2,
      
      titleTextStyle:GoogleFonts.brunoAce(fontSize: 28.0, fontWeight: FontWeight.w400),
      bodyTextStyle:GoogleFonts.abel(fontSize: 19.0,fontWeight:FontWeight.bold,color:Colors.black54),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 2000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: TextButton(
                onPressed: () {
                  print("pressed");
                  _onIntroEnd(context);
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.abel(
                      color: Colors.indigo, fontWeight: FontWeight.bold),
                ),
              )

              //  _buildImage('https://static.vecteezy.com/system/resources/previews/023/982/122/non_2x/friendly-cute-cartoon-robot-created-with-generative-ai-png.png', 100),

              ),
        ),
      ),
      // globalFooter: SizedBox(
      //   width: double.infinity,
      //   height: 60,
      //   child: ElevatedButton(
      //     child: const Text(
      //       'Let\'s go right away!',
      //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      //     ),
      //     onPressed: () => _onIntroEnd(context),
      //   ),
      // ),
      pages: [
        PageViewModel(
          title: "Personalized Learning Paths:",
          body:"Unlock AI insights tailored to your level, no matter where you are in your educational journey",
          image:Image.asset("assets/images/pngtree.png"),
          //  _buildImage(
          //     'https://png.pngtree.com/png-clipart/20230411/original/pngtree-artificial-intelligence-robot-illustration-png-image_9047239.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Tailored Curriculum",
          body:
              "Access customized educational content to suit your unique learning style, fostering deeper understanding and mastery.",
          image:Image.asset("assets/images/pngtreethree.png"), 
          //  _buildImage(
          //     'https://static.vecteezy.com/system/resources/previews/024/516/691/original/cute-robot-on-transparent-background-ai-png.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Intelligent Tutoring System",
          body:
              "Receive real-time feedback and guidance from AI tutors, ensuring a dynamic and effective learning experience.",
          image: Image.asset("assets/images/pngtreefour.png"),
          //  _buildImage(
          //     'https://png.pngtree.com/png-vector/20240313/ourmid/pngtree-artificial-intelligence-modern-computing-concept-png-image_11936748.png'),
          decoration: pageDecoration,
        ),

      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back,color: Colors.white),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
      next: const Icon(Icons.arrow_forward,color: Colors.white,),
      done: const Text('Login', style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
      curve: Curves.bounceInOut,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator:  DotsDecorator(
        activeColor: Colors.blue.shade200,
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator:  ShapeDecoration(
        color: Colors.black45,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}
