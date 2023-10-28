import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:serene_space_final/pages/home.dart';
import 'package:serene_space_final/pages/quiz.dart';
import 'package:serene_space_final/pages/register_page.dart';
import 'colors.dart' as color;

import 'firebase_auth.dart';
import 'login.dart';

class IndexPage extends StatefulWidget {
  final User user;

  const IndexPage.IndexPage({required this.user});

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Home')
          ],
        ),
        backgroundColor: color.AppColor.homePageBackground,
        body: SafeArea(
            child: Center(
              child: Column(children: [
                const Padding(
                    padding: EdgeInsets.fromLTRB(300, 20, 0, 40),
                    child: Image(
                        width: 200,
                        height: 110,
                        image: AssetImage('images\\logo.png'))),
                Text("Hello ${_currentUser.displayName}", style: TextStyle(fontSize: 25)),
                const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                    child:
                    Text("Your Daily Reset", style: TextStyle(fontSize: 20))),
                Container(
                    width: MediaQuery.of(context).size.height / 2.7,
                    height: MediaQuery.of(context).size.height / 2.2,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: SafeArea(
                        child: Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: Text("Quote",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 30))),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      QuizScreen(),
                                                ),
                                              );
                                            },
                                            child: Text(""))),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: Text("Spotify",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 30))),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white),
                                            onPressed: () {},
                                            child: Text(""))),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: Text("Quiz",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 30))),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      QuizScreen(),
                                                ),
                                              );
                                            },
                                            child: Text(""))),
                                  ],
                                )),
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: Text("Resources",
                                            style: TextStyle(
                                                color: Colors.white, fontSize: 30))),
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(50, 0, 0, 0),
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors.white),
                                            onPressed: () {},
                                            child: Text(""))),
                                  ],
                                )),
                          ],
                        )))
              ]),
            )));
  }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('Profile'),
  //     ),
  //     body: Center(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(
  //             'NAME: ${_currentUser.displayName}',
  //             style: Theme.of(context).textTheme.bodyText1,
  //           ),
  //           SizedBox(height: 16.0),
  //           Text(
  //             'EMAIL: ${_currentUser.email}',
  //             style: Theme.of(context).textTheme.bodyText1,
  //           ),
  //           SizedBox(height: 16.0),
  //           _currentUser.emailVerified
  //               ? Text(
  //             'Email verified',
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .bodyText1!
  //                 .copyWith(color: Colors.green),
  //           )
  //               : Text(
  //             'Email not verified',
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .bodyText1!
  //                 .copyWith(color: Colors.red),
  //           ),
  //           SizedBox(height: 16.0),
  //           _isSendingVerification
  //               ? CircularProgressIndicator()
  //               : Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               ElevatedButton(
  //                 onPressed: () async {
  //                   setState(() {
  //                     _isSendingVerification = true;
  //                   });
  //                   await _currentUser.sendEmailVerification();
  //                   setState(() {
  //                     _isSendingVerification = false;
  //                   });
  //                 },
  //                 child: Text('Verify email'),
  //               ),
  //               SizedBox(width: 8.0),
  //               IconButton(
  //                 icon: Icon(Icons.refresh),
  //                 onPressed: () async {
  //                   User? user = await FireAuth.refreshUser(_currentUser);
  //
  //                   if (user != null) {
  //                     setState(() {
  //                       _currentUser = user;
  //                     });
  //                   }
  //                 },
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 16.0),
  //           _isSigningOut
  //               ? CircularProgressIndicator()
  //               : ElevatedButton(
  //             onPressed: () async {
  //               setState(() {
  //                 _isSigningOut = true;
  //               });
  //               await FirebaseAuth.instance.signOut();
  //               setState(() {
  //                 _isSigningOut = false;
  //               });
  //               Navigator.of(context).pushReplacement(
  //                 MaterialPageRoute(
  //                   builder: (context) => LoginPage(),
  //                 ),
  //               );
  //             },
  //
  //             child: Text('Sign out'),
  //             style: ElevatedButton.styleFrom(
  //               primary: Colors.red,
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(30),
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}