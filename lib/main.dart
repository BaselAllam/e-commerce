
/*

 Ui Design => https://www.figma.com/design/lD9YlPc3h0HVl8TLSFokRC/Clothing-Store-App%2FFashion-E-Commerce-App-%7C-App%C2%A0UI%C2%A0Kit-(Community)?node-id=0-1&node-type=canvas&t=dupwFb2mPfH8NhHT-0

 Next Session:
  - Navigation
  - Complete Screen
  - BottomNavBar

*/

import 'package:flutter/material.dart';
import 'package:ecommerce/app_setting/views/home_page_screen.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}