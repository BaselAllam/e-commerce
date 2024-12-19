import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/back_btn.dart';
import 'package:ecommerce/shared/shared_widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isSecure = true;
  String gender = '';

  bool isEditable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('My Profile', style: AppFonts.primaryBlackStyle),
        centerTitle: false,
        leading: BackBtn(),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
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
                ),
              ],
            ),
            SizedBox(height: 50.0),
            field(
              label: 'Email Address',
              icon: Icons.email,
              controller: emailController,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              isEnabled: isEditable
            ),
            SizedBox(height: 30.0),
            field(
              label: 'User Name',
              icon: Icons.person,
              controller: userNameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              isEnabled: isEditable
            ),
            SizedBox(height: 30.0),
            field(
              label: 'Phone Number',
              icon: Icons.phone,
              controller: phoneController,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
              isEnabled: isEditable,
              formaters: [FilteringTextInputFormatter.digitsOnly]
            ),
            SizedBox(height: 30.0),
            field(
              label: 'Password',
              icon: Icons.lock,
              controller: passwordController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              isEnabled: isEditable,
              isSecure: isSecure,
              suffixIcon: IconButton(
                icon: Icon(Icons.remove_red_eye),
                color: AppColors.greyColor,
                iconSize: 15,
                onPressed: () {
                  isSecure = !isSecure;
                  setState(() {});
                },
              )
            ),
            SizedBox(height: 15.0),
            ListTile(
              title: Text('Gender', style: AppFonts.primaryBlackStyle),
              subtitle: Text(gender, style: AppFonts.subGreyStyle),
              trailing: PopupMenuButton(
                icon: Icon(Icons.arrow_downward, color: AppColors.jeansColor, size: 20.0),
                onSelected: (value) {
                  gender = value;
                  setState(() {});
                },
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: Text('Male', style: AppFonts.subBlackStyle),
                      value: 'Male',
                    ),
                    PopupMenuItem(
                      child: Text('FeMale', style: AppFonts.subBlackStyle),
                      value: 'FeMale',
                    ),
                  ];
                },
              ),
            ),
            SizedBox(height: 30.0),
            Column(
              children: [
                TextButton(
                  child: Text(isEditable ? 'Save' : 'Edit', style: AppFonts.primaryWhiteStyle),
                  style: TextButton.styleFrom(
                    backgroundColor: isEditable ? AppColors.jeansColor : AppColors.greyColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(200, 50)
                  ),
                  onPressed: () {
                    isEditable = !isEditable;
                    setState(() {});
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}