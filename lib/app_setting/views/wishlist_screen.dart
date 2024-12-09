import 'package:ecommerce/app_setting/views/notification_screen.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Wishlist', style: AppFonts.subGreyStyle),
        centerTitle: false,
        actions: [
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle
            ),
            child: IconButton(
              icon: Icon(Icons.notifications, color: AppColors.jeansColor, size: 20.0,),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => NotificationScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}