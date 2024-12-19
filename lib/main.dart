
/*

 Ui Design => https://www.figma.com/design/lD9YlPc3h0HVl8TLSFokRC/Clothing-Store-App%2FFashion-E-Commerce-App-%7C-App%C2%A0UI%C2%A0Kit-(Community)?node-id=0-1&node-type=canvas&t=dupwFb2mPfH8NhHT-0
 


 Next Session:
  - DatePicker
  - Packages & Libraries 
  - Shared Preferences
  - icon Launcher
  - Device Camera
  - Integration Google Maps

 Next Session:
  - Intro to Front-end, Back-end & APIs
  - Integraations Firebase
  - Intro State Managment

 Next Session:
  - State Managment
  - Integration

 Next Session:
  - Continue with State Managment

 Next Session:
  - App Responsive
  - Release App

*/


import 'package:ecommerce/user/views/login_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    );
  }
}