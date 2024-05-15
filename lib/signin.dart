import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  static String id = "SignInScreen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                hintText: "Email",
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
              child: Text('Login'),
              style: FilledButton.styleFrom(
                backgroundColor: Colors.pink[700],
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 10.0,
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
