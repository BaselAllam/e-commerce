import 'package:ecommerce/app_setting/views/home_page_screen.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/notification_button.dart';
import 'package:ecommerce/shared/shared_widgets/product_widget.dart';
import 'package:flutter/material.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Wishlist', style: AppFonts.primaryBlackStyle),
        centerTitle: false,
        actions: [
          NotificationButton()
        ],
      ),
      body: Container(
      margin: EdgeInsets.all(10.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7
        ),
        shrinkWrap: true,
        children: [
          for (int i = 0; i < products.length; i++)
          ProductWidget(productData: products[i],)
        ],
      ),
    )
    );
  }
}