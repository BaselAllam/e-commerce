import 'package:ecommerce/app_setting/views/bottom_nav_bar.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/field.dart';
import 'package:ecommerce/shared/shared_widgets/snack.dart';
import 'package:ecommerce/user/views/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Text('Welcome! \n Let\'s Start', style: TextStyle(color: AppColors.blackColor, fontSize: 45, fontWeight: FontWeight.bold)),
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
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                onTap: () {},
                child: Text('Forget Password ?  ', style: AppFonts.minGreyStyle)
              ),
            ),
            SizedBox(height: 15.0),
            Column(
              children: [
                TextButton(
                  child: Text('Login', style: AppFonts.primaryWhiteStyle),
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.jeansColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    fixedSize: Size(200, 50)
                  ),
                  onPressed: () {
                    if (emailController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snack(txt: 'Email Required')
                      );
                    } else if (passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snack(txt: 'Password Required')
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        snack(txt: 'Success', color: Colors.green)
                      );
                      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (_) => BottomNavBarScreen()));
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => RegisterScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account ?  ', style: AppFonts.minGreyStyle),
                  Text('Sign up', style: AppFonts.miniJeansStyle),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}