import 'package:flutter/material.dart';
import 'colors.dart' as color;

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});
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
            Text("Hello [Name]", style: TextStyle(fontSize: 25)),
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
}
