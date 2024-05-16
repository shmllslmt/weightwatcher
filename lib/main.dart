import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weightwatcher/bmibrain.dart';
import 'package:weightwatcher/firebase_options.dart';
import 'package:weightwatcher/history.dart';
import 'package:weightwatcher/input.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weightwatcher/result.dart';
import 'package:weightwatcher/signin.dart';
import 'package:weightwatcher/signup.dart';


void main() async {
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(BMIApp());
}

class BMIApp extends StatelessWidget {
  const BMIApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BMIBrain())
      ],
      child: MaterialApp(
        title: "BMI Calculator",
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: SignInScreen.id,
        routes: {
          SignInScreen.id: (context) => SignInScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          InputScreen.id: (context) => InputScreen(),
          ResultScreen.id: (context) => ResultScreen(),
          HistoryScreen.id: (context) => HistoryScreen(),
        },
      ),
    );
  }
}


