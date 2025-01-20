import 'package:ecommerce/app_setting/views/bottom_nav_bar.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/back_btn.dart';
import 'package:ecommerce/shared/shared_widgets/field.dart';
import 'package:ecommerce/shared/shared_widgets/snack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isSecure = true;
  bool isTermsAccepted = false;
  String gender = '';
  String birthDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ListTile(
              leading: BackBtn(),
              title: Text('Welcome! Let\'s Create a new Account', style: AppFonts.primaryBlackStyle),
            ),
            SizedBox(height: 50.0),
            field(
              label: 'Email Address',
              icon: Icons.email,
              controller: emailController,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done
            ),
            SizedBox(height: 30.0),
            field(
              label: 'User Name',
              icon: Icons.person,
              controller: userNameController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done
            ),
            SizedBox(height: 30.0),
            field(
              label: 'Phone Number',
              icon: Icons.phone,
              controller: phoneController,
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.done,
              formaters: [FilteringTextInputFormatter.digitsOnly]
            ),
            SizedBox(height: 30.0),
            field(
              label: 'Password',
              icon: Icons.lock,
              controller: passwordController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
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
            field(
              label: 'Confirm Password',
              icon: Icons.lock,
              controller: confirmPasswordController,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
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
            ListTile(
              title: Text('Birthdate', style: AppFonts.primaryBlackStyle),
              subtitle: Text(birthDate, style: AppFonts.subGreyStyle),
              trailing: IconButton(
                icon: Icon(Icons.calendar_month),
                color: AppColors.jeansColor,
                iconSize: 20,
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(DateTime.now().year - 100),
                    lastDate: DateTime(DateTime.now().year - 25),
                    currentDate: DateTime(DateTime.now().year - 25)
                  );
                  birthDate = selectedDate.toString().substring(0, 11);
                  setState(() {});
                },
              )
            ),
            ListTile(
              title: Text('Accept our Terms & Conditions', style: AppFonts.primaryBlackStyle),
              subtitle: Text('read our terms & conditions', style: AppFonts.subGreyStyle),
              trailing: Switch(
                activeColor: AppColors.jeansColor,
                thumbColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.jeansColor.withOpacity(.48);
                  }
                  return AppColors.jeansColor;
                }),
                value: isTermsAccepted,
                onChanged: (v) {
                  isTermsAccepted = v;
                  setState(() {});
                }
              ),
              onTap: () {},
            ),
            SizedBox(height: 30.0),
            Column(
              children: [
                TextButton(
                  child: Text('Register', style: AppFonts.primaryWhiteStyle),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.jeansColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(200, 50)
                  ),
                  onPressed: () {
                    if (emailController.text.isEmpty || userNameController.text.isEmpty || phoneController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snack(txt: 'Some Fields Required')
                      );
                    } else if (passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snack(txt: 'Password Required')
                      );
                    } else if (confirmPasswordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snack(txt: 'Confirm Password Required')
                      );
                    } else if (passwordController.text != confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snack(txt: 'Password not match with Confirm Password')
                      );
                    } else if (!isTermsAccepted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snack(txt: 'Please Accept our Terms')
                      );
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   snack(txt: 'Success', color: Colors.green)
                      // );
                      // Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => BottomNavBarScreen()));
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Have an account ?  ', style: AppFonts.minGreyStyle),
                  Text('Login', style: AppFonts.miniJeansStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}