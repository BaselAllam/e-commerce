import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Notifications', style: AppFonts.primaryBlackStyle),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.blackColor, width: 0.5),
              shape: BoxShape.circle
            ),
            child: Icon(Icons.arrow_back_ios, color: AppColors.blackColor, size: 20.0),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.jeansColor,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 30,
            padding: EdgeInsets.only(left: 10.0, right: 10),
            alignment: Alignment.center,
            child: Text('2 New', style: AppFonts.miniWhiteStyle,),
          )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Today', style: AppFonts.subBlackStyle),
                InkWell(
                  onTap: () {},
                  child: Text('Mark All As Read', style: AppFonts.miniJeansStyle),
                )
              ],
            ),
          ),
          for (int i = 0; i < 5; i++)
          Column(
            children: [
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.jeansColor,
                    shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.local_shipping, color: AppColors.whiteColor, size: 30)
                ),
                title: Text('Order Shipped', style: AppFonts.primaryBlackStyle),
                trailing: Text('1H', style: AppFonts.minGreyStyle),
                subtitle: Text('Order Shipped Sucess and maybe delivered within 24 Hours', style: AppFonts.minGreyStyle),
                onTap: () {},
              ),
              Divider(color: AppColors.greyColor, thickness: 0.5, endIndent: 20, indent: 20)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Yesterday', style: AppFonts.subBlackStyle),
                InkWell(
                  onTap: () {},
                  child: Text('Mark All As Read', style: AppFonts.miniJeansStyle),
                )
              ],
            ),
          ),
          for (int i = 0; i < 5; i++)
          Column(
            children: [
              ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.jeansColor,
                    shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.local_shipping, color: AppColors.whiteColor, size: 30)
                ),
                title: Text('Order Shipped', style: AppFonts.primaryBlackStyle),
                trailing: Text('1H', style: AppFonts.minGreyStyle),
                subtitle: Text('Order Shipped Sucess and maybe delivered within 24 Hours', style: AppFonts.minGreyStyle),
                onTap: () {},
              ),
              Divider(color: AppColors.greyColor, thickness: 0.5, endIndent: 20, indent: 20)
            ],
          ),
        ],
      ),
    );
  }
}