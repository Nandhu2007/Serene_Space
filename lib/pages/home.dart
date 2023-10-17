import 'package:flutter/material.dart';
import 'colors.dart' as color;

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.AppColor.homePageBackground,
        body: Image(image: AssetImage('images\\logo.png')));
  }
}
