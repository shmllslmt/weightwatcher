import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';
import 'package:weightwatcher/bmibrain.dart';
import 'package:weightwatcher/result.dart';
import 'reusablecard.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  late final GenerativeModel model;
  late final ChatSession chat;
  bool hasAPIKey = false;

  @override
  void initState() {
    super.initState();

    hasAPIKey = dotenv.env['API_KEY'] != null && dotenv.env['API_KEY']!.isNotEmpty;

    if(hasAPIKey) {
      model =
          GenerativeModel(model: 'gemini-pro', apiKey: dotenv.env['API_KEY']!);
      chat = model.startChat();

      if(model != null) {
        print("Good to go!");
      }
    } else {
      print("No API key.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.pink[800],
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      onChanged: (value) {
                        context.read<BMIBrain>().updateName(value);
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: "write your name here",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    header: "WEIGHT",
                    content: context.watch<BMIBrain>().berat.toString(),
                    onPlusPress: () {
                      context.read<BMIBrain>().increaseWeight();
                    },
                    onMinusPress: () {
                      context.read<BMIBrain>().decreaseWeight();
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    header: "HEIGHT",
                    content: context.watch<BMIBrain>().tinggi.toString(),
                    onPlusPress: () => context.read<BMIBrain>().increaseHeight()
                    ,
                    onMinusPress: () {
                      context.read<BMIBrain>().decreaseHeight();
                    },
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {
              context.read<BMIBrain>().promptDietPlan(chat);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen()));
            },
            child: Text("CALCULATE"),
            color: Colors.pink[700],
            height: 100.0,
          ),
        ],
      ),
    );
  }
}
