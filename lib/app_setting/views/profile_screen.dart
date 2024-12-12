import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/notification_button.dart';
import 'package:flutter/material.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  List profileSections = [
    {
      'icon': Icons.person,
      'title': 'Profile',
      'screen': ''
    },
    {
      'icon': Icons.settings,
      'title': 'Settings',
      'screen': ''
    },
    {
      'icon': Icons.info_outline,
      'title': 'About us',
      'screen': ''
    },
    {
      'icon': Icons.phone,
      'title': 'Contact us',
      'screen': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Profile', style: AppFonts.primaryBlackStyle),
        centerTitle: false,
        actions: [
          NotificationButton(),
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 150,
              width: 150,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                  fit: BoxFit.contain,
                ),
                shape: BoxShape.circle
              ),
            ),
            for (int i = 0; i < profileSections.length; i++)
            Container(
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    color: AppColors.jeansColor,
                    shape: BoxShape.circle
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Icon(profileSections[i]['icon'], color: AppColors.whiteColor, size: 25.0)
                ),
                title: Text(profileSections[i]['title'], style: AppFonts.subBlackStyle),
                trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyColor, size: 20.0),
                onTap: () {
                  // Navigator.push(context, CupertinoPageRoute(builder: (_) => SearchResultScreen(screenTitle: categories[i]['title'])));
                },
              ),
            ),
            SizedBox(height: 20.0),
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.logout, color: Colors.red, size: 25.0)
              ),
              title: Text('Sign out', style: TextStyle(color: Colors.red, fontSize: 20.0)),
              onTap: () {},
            ),
          ],
        )
      ),
    );
  }
}