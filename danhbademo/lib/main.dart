import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'module/screen1.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget example1 = SplashScreenView(
      navigateRoute: Bottombar(),
      duration: 5000,
      imageSize: 130,
      imageSrc: "assets/images/add_contact.png",
      text: "Danh Ba Demo",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Color.fromARGB(255, 118, 255, 175),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Danh Ba demo',
      home: example1,
    );
  }
}
