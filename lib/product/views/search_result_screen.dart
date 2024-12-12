import 'package:ecommerce/app_setting/views/home_page_screen.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/back_btn.dart';
import 'package:ecommerce/shared/shared_widgets/product_widget.dart';
import 'package:flutter/material.dart';



class SearchResultScreen extends StatefulWidget {
  final String screenTitle;
  SearchResultScreen({required this.screenTitle});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(widget.screenTitle, style: AppFonts.primaryBlackStyle),
        centerTitle: false,
        leading: BackBtn(),
        bottom: PreferredSize(
          preferredSize: Size(0.0, 50),
          child: ListTile(
            title: Text('${products.length} Products', style: AppFonts.primaryGreyStyle,),
            trailing: IconButton(
              icon: Icon(Icons.tune),
              color: AppColors.jeansColor,
              iconSize: 25.0,
              onPressed: () {},
            ),
          )
        ),
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