import 'package:ecommerce/app_setting/views/basket_screen.dart';
import 'package:ecommerce/app_setting/views/home_page_screen.dart';
import 'package:ecommerce/app_setting/views/profile_screen.dart';
import 'package:ecommerce/app_setting/views/wishlist_screen.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';


class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  List screens = [
    HomePage(), BasketScreen(), WishlistScreen(), ProfileScreen()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ],
        selectedIconTheme: IconThemeData(color: AppColors.jeansColor, size: 25.0),
        selectedLabelStyle: AppFonts.miniJeansStyle,
        selectedItemColor: AppColors.jeansColor,
        unselectedIconTheme: IconThemeData(color: AppColors.greyColor, size: 25.0),
        unselectedLabelStyle: AppFonts.subGreyStyle,
        unselectedItemColor: AppColors.greyColor,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0.0,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
      ),
      body: screens[selectedIndex],
    );
  }
}