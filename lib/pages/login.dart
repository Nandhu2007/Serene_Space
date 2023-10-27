import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'colors.dart' as color;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.AppColor.homePageBackground,
        body: SafeArea(
            child: Center(
                child: Column(children: [
          Image(width: 189, height: 256, image: AssetImage('images\\logo.png')),
          Text('Login Here', style: TextStyle(fontSize: 20)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "Username",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(225, 20, 0, 0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {},
                  child: Text("Submit")))
        ]))));
  }
}
