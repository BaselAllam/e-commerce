import 'package:ecommerce/app_setting/views/home_page_screen.dart';
import 'package:ecommerce/product/views/search_result_screen.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/back_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('All Categories', style: AppFonts.primaryBlackStyle),
        centerTitle: false,
        leading: BackBtn(),
      ),
      body: Container(
        child: ListView(
          children: [
            for (int i = 0; i < categories.length; i++)
            ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(10.0),
                child: Icon(categories[i]['icon'], color: AppColors.jeansColor, size: 25.0)
              ),
              title: Text(categories[i]['title'], style: AppFonts.subBlackStyle),
              trailing: Icon(Icons.arrow_forward_ios, color: AppColors.greyColor, size: 20.0),
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (_) => SearchResultScreen(screenTitle: categories[i]['title'])));
              },
            )
          ],
        )
      ),
    );
  }
}