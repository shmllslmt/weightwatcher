import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static String id = "SignUpScreen";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              child: Image.asset(
                "images/logo.png",
                height: 100,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            TextField(
              onChanged: (value) {
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Username",
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              onChanged: (value) {
              },
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            FilledButton(
              onPressed: () {

              },
              child: Text('Sign Up'),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.pink[100],
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
