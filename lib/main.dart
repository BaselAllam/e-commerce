
/*

 Next Session:
  - Intro to Front-end, Back-end & APIs
  - Intro State Managment
  - Complete Google Map Functions

 Next Session:
  - State Managment
  - Integration

 Next Session:
  - Continue with State Managment

 Next Session:
  - App Responsive
  - Release App

*/


import 'package:ecommerce/app_setting/views/bottom_nav_bar.dart';
import 'package:ecommerce/user/views/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyD2vaIydiu7SCllheUN0IFRHEIg04TFL7E",
    authDomain: "",
    projectId: "ecommerce-73033",
    storageBucket: "ecommerce-73033.firebasestorage.app",
    messagingSenderId: "your-messaging-sender-id",
    appId: "1:1085891780434:android:fbe45a33fe6a8c1045a48b",
  );
  await Firebase.initializeApp(options: firebaseConfig);
  runApp(MyApp());
}


class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn = false;

  @override
  void initState() {
    checkIsLoggedIn();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? BottomNavBarScreen() : LoginScreen()
    );
  }

  checkIsLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? isLogged = sharedPreferences.getBool('isLoggedIn');
    if (isLogged == null || !isLogged) {
      isLoggedIn = false; 
    } else {
      isLoggedIn = true;
    }
    setState(() {});
  }
}