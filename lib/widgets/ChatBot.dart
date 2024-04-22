import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ikchatbot/ikchatbot.dart';
import 'package:simple_icons/simple_icons.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:typethis/typethis.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    IkChatBotConfig chatBotConfig = IkChatBotConfig(
      //SMTP Rating to your mail Settings
      ratingIconYes: const Icon(Icons.star),
      ratingIconNo: const Icon(Icons.star_border),
      ratingIconColor: Colors.black,
      ratingBackgroundColor: Colors.white,
      ratingButtonText: 'Submit Rating',
      thankyouText: 'Thanks for your rating!',
      ratingText: 'Rate your experience:',
      ratingTitle: 'Thank you for using the chatbot!',
      body: 'This is a test email sent from Flutter and Dart.',
      subject: 'Test Rating',
      recipient: 'recipient@example.com',
      isSecure: false,
      senderName: 'Your Name',
      smtpUsername: 'Your Email',
      smtpPassword: 'your password',
      smtpServer: 'stmp.gmail.com',
      smtpPort: 587,
      //Settings to your system Configurations
      sendIcon: const Icon(Icons.send, color: Colors.black),
      userIcon: const Icon(SimpleIcons.andela, color: Colors.white),
      botIcon: const Icon(Icons.android, color: Colors.white),
      botChatColor: Color.fromARGB(255, 104, 0, 101),
      delayBot: 100,
      closingTime: 1000,
      delayResponse: 1,
      userChatColor: Color.fromARGB(255, 228, 208, 208),
      waitingTime: 1000,
      keywords: ["one", "two"],
      responses: ["hello", "World"],
      backgroundColor: Colors.white,
      backgroundImage:
          'https://news.uchicago.edu/sites/default/files/styles/full_width/public/images/2023-07/Human%20aware%20AI%20hero.png?itok=BL5ceKsp',
      backgroundAssetimage: "assets/gif/chatBG.gif",
      initialGreeting:
          "Hello! \nWelcome to  Gnovation ChatBot.\nHow can I assist you today?",
      defaultResponse: "Sorry, I didn't understand your response.",
      inactivityMessage: "Is there anything else you need help with?",
      closingMessage: "This conversation will now close.",
      inputHint: 'Send a message',
      waitingText: 'Please wait...',
      useAsset: true,
    );

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(chatBotConfig: chatBotConfig),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final IkChatBotConfig chatBotConfig;

  const MyHomePage({Key? key, required this.chatBotConfig}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _chatIsOpened = false;
  
  final TypeThisController _controller = TypeThisController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:TypeThis(
                    string: 'Gnovation ai',
                    controller: _controller,
                    speed: 100,
                    style: GoogleFonts.vt323(fontSize: 32, color: Colors.green),
                    richTextMatchers: const [
                      TypeThisMatcher(
                        'Gnovation',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                          // decoration: TextDecoration.underline,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
        ),
        body: _chatIsOpened
            ? const Center(
                child: Text('Welcome to my app,'),
              )
            : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/gif/chatBGTwo.gif",),
              fit: BoxFit.cover)),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    Container(
                      height: MediaQuery.of(context).size.height*1,
                      width: MediaQuery.of(context).size.width*1,
                      child: ikchatbot(config: widget.chatBotConfig)),
                  ],
                ),
              ),
          
            ));
  }
}
