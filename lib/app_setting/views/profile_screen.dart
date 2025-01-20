import 'package:ecommerce/app_setting/views/about_us.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/notification_button.dart';
import 'package:ecommerce/shared/shared_widgets/snack.dart';
import 'package:ecommerce/user/views/user_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restart_app/restart_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

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
      'screen': UserProfileScreen()
    },
    {
      'icon': Icons.settings,
      'title': 'Settings',
      'screen': ''
    },
    {
      'icon': Icons.info_outline,
      'title': 'About us',
      'screen': AboutUsScreen()
    },
    {
      'icon': Icons.phone,
      'title': 'Contact us',
      'screen': ''
    },
  ];

  File? pickedImg;

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
            InkWell(
              child: Container(
                height: 150,
                width: 150,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  image: pickedImg == null ? DecorationImage(
                    image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                    fit: BoxFit.contain,
                  ) : DecorationImage(
                    image: FileImage(pickedImg!),
                    fit: BoxFit.contain,
                  ),
                  shape: BoxShape.circle
                ),
              ),
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('Attention', style: AppFonts.primaryBlackStyle),
                      content: Text('Choose Camera or Gallery', style: AppFonts.subGreyStyle),
                      actions: [
                        TextButton(
                          child: Text('Camera', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            fixedSize: Size(100, 30)
                          ),
                          onPressed: () {
                            addImg(ImageSource.camera);
                          },
                        ),
                        TextButton(
                          child: Text('Gallery', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            fixedSize: Size(100, 30)
                          ),
                          onPressed: () {
                            addImg(ImageSource.gallery);
                          },
                        ),
                      ],
                    );
                  }
                );
              },
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
                  Navigator.push(context, CupertinoPageRoute(builder: (_) => profileSections[i]['screen']));
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
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      title: Text('Attention', style: AppFonts.primaryBlackStyle),
                      content: Text('Are u sure u want to logout ?', style: AppFonts.subGreyStyle),
                      actions: [
                        TextButton(
                          child: Text('Yes', style: TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            fixedSize: Size(100, 30)
                          ),
                          onPressed: () async {
                            SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                            sharedPreferences.clear();
                            Restart.restartApp();
                          },
                        ),
                        TextButton(
                          child: Text('No', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            fixedSize: Size(100, 30)
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  }
                );
              },
            ),
          ],
        )
      ),
    );
  }

  addImg(ImageSource imageSource) async {
    XFile? img = await ImagePicker().pickImage(source: imageSource);
    if (img != null) {
      pickedImg = File(img.path);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snack(txt: 'No Img Captured'));
    }
    setState(() {});
  }
}