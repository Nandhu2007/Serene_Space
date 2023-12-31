import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:serene_space_final/pages/index.dart';
import 'package:serene_space_final/pages/register_page.dart';
import 'package:serene_space_final/pages/validator.dart';
import 'colors.dart' as color;
import 'firebase_auth.dart';




class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  bool _isProcessing = false;


  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => IndexPage.IndexPage(
            user: user,
          ),
        ),
      );
    }

    return firebaseApp;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.AppColor.homePageBackground,
      body: FutureBuilder(
        future: initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Center(
                      child: Column(children: [
                        const Image(width: 189, height: 256, image: AssetImage('images\\logo.png')),
                        const Text('Login Here', style: TextStyle(fontSize: 20)),
                      ],
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: usernameController,
                          focusNode: _focusEmail,
                          textInputAction: TextInputAction.next,
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Please enter some text';
                            return Validator.validateEmail(email: value);
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Email",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        TextFormField(
                          controller: passwordController,
                          focusNode: _focusPassword,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) return 'Please enter some text';
                            return Validator.validatePassword(
                              password: value,
                            );
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Password",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        _isProcessing
                            ? CircularProgressIndicator()
                            : Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                onPressed: () async {
                                  _focusEmail.unfocus();
                                  _focusPassword.unfocus();

                                  if (_formKey.currentState!
                                      .validate()) {
                                    setState(() {
                                      _isProcessing = true;
                                    });

                                    User? user = await FireAuth.signInUsingEmailPassword(
                                      email: usernameController.text,
                                      password: passwordController.text,
                                      context: context
                                    );


                                    setState(() {
                                      _isProcessing = false;
                                    });
                                    print(user == null);
                                    if (user != null) {
                                      Navigator.of(context)
                                          .pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              IndexPage.IndexPage(user: user),
                                        ),
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 24.0),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RegisterPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Register',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  } //widget
}//class


