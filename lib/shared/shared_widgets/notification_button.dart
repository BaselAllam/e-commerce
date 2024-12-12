import 'package:ecommerce/app_setting/views/notification_screen.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class NotificationButton extends StatefulWidget {
  const NotificationButton({super.key});

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}