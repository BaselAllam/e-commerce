import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/about_us_txt.dart';
import 'package:ecommerce/shared/shared_widgets/back_btn.dart';
import 'package:flutter/material.dart';



class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0.0,
        title: Text('About us', style: AppFonts.primaryBlackStyle),
        leading: BackBtn(),
      ),
      body: Container(
        child: ListView(
          children: [
            ListTile(
              title: Text('Cancelation Policy', style: AppFonts.subBlackStyle),
              subtitle: Text(cancelationPolicy, style: AppFonts.subGreyStyle),
            ),
            ListTile(
              title: Text('Terms & Conditions', style: AppFonts.subBlackStyle),
              subtitle: Text(termsAndConditions, style: AppFonts.subGreyStyle),
            ),
          ],
        ),
      ),
    );
  }
}