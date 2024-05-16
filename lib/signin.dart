import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weightwatcher/input.dart';
import 'package:weightwatcher/signup.dart';

class SignInScreen extends StatefulWidget {
  static String id = "SignInScreen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? email;
  String? password;

  final _auth = FirebaseAuth.instance;

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
                email = value;
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
                password = value;
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
              onPressed: () async {
                try {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email!, password: password!);

                  if (user != null) {
                    Navigator.pushNamed(context, InputScreen.id);
                  }
                } catch (e) {
                  print(e.toString());
                }
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
                Navigator.pushNamed(context, SignUpScreen.id);
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
