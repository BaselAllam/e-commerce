import 'package:ecommerce/app_setting/views/home_page_screen.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/back_btn.dart';
import 'package:ecommerce/shared/shared_widgets/fav_button.dart';
import 'package:flutter/material.dart';


class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  List imgs = [
    'https://images.pexels.com/photos/1619697/pexels-photo-1619697.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/1094084/pexels-photo-1094084.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/1619730/pexels-photo-1619730.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/1620796/pexels-photo-1620796.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/1139613/pexels-photo-1139613.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/1564828/pexels-photo-1564828.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/713959/pexels-photo-713959.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/1650093/pexels-photo-1650093.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/301977/pexels-photo-301977.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/573243/pexels-photo-573243.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/29784434/pexels-photo-29784434/free-photo-of-close-up-of-toddler-s-shoe-in-autumn-leaves.jpeg?auto=compress&cs=tinysrgb&w=800'
  ];

  String selectedImg = 'https://images.pexels.com/photos/1619697/pexels-photo-1619697.jpeg?auto=compress&cs=tinysrgb&w=800';

  Map sizes = {
    'S': true,
    'M': false,
    'L': false,
    'XL': false,
    'XXL': false,
  };
  
  List colors = [
    {
      'name': 'Red',
      'color': Colors.red,
      'isSelected': true
    },
    {
      'name': 'Black',
      'color': Colors.black,
      'isSelected': false
    },
    {
      'name': 'Green',
      'color': Colors.green,
      'isSelected': false
    },
    {
      'name': 'Blue',
      'color': Colors.blue,
      'isSelected': false
    },
    {
      'name': 'Yellow',
      'color': Colors.yellow,
      'isSelected': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomSheet: buildBottom(),
      body: ListView(
        children: [
          imagesSection(),
          ListTile(
            title: Text('Females Style', style: AppFonts.subBlackStyle),
            trailing: Text('⭐ 4.5', style: AppFonts.minGreyStyle),
            subtitle: Text('Light Brown Jacket', style: AppFonts.primaryBlackStyle),
          ),
          ListTile(
            title: Text('Product Details', style: AppFonts.primaryBlackStyle),
            subtitle: Text('Product Details Description bla bla bla Product Details Description bla bla bla Product Details Description bla bla bla Product Details Description bla bla bla', style: AppFonts.subGreyStyle),
          ),
          Divider(endIndent: 30, indent: 30, color: AppColors.greyColor, thickness: 0.3),
          buildSizesSection(),
          buildColorsSection()
        ],
      ),
    );
  }

  buildBottom() {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        color: AppColors.whiteColor,
      ),
      padding: EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price', style: AppFonts.subGreyStyle),
              Text('200EGP', style: AppFonts.primaryBlackStyle),
            ],
          ),
          TextButton(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.shopping_cart, color: AppColors.whiteColor),
                Text('Add to cart', style: AppFonts.subWhiteStyle),
              ],
            ),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              backgroundColor: AppColors.jeansColor,
              fixedSize: Size(150, 40),
            ),
            onPressed: () {},
          )
        ],
      ),
    );
  }

  imagesSection() {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(selectedImg),
          fit: BoxFit.fill
        )
      ),
      padding: EdgeInsets.only(bottom: 10, top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackBtn(),
              Text('Product Details', style: AppFonts.primaryBlackStyle),
              FavButton(productData: products[0])
            ],
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 1.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: AppColors.whiteColor
            ),
            padding: EdgeInsets.fromLTRB(5.0, 3, 5, 3),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < 5; i++)
                InkWell(
                  onTap: () {
                    selectedImg = imgs[i];
                    setState(() {});
                  },
                  child: Container(
                    height: 70.0,
                    width: 70.0,
                    margin: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(imgs[i]),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                ),
                Container(
                  height: 70.0,
                  width: 70.0,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(imgs.last),
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken
                      ),
                    )
                  ),
                  alignment: Alignment.center,
                  child: Text('+${imgs.length - 5}', style: AppFonts.miniWhiteStyle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  buildSizesSection() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Size', style: AppFonts.subBlackStyle),
          Row(
            children: [
              for (String i in sizes.keys)
              InkWell(
                onTap: () {
                  sizes[i] = !sizes[i];
                  for (String x in sizes.keys) {
                    if (x != i) {
                      sizes[x] = false;
                    }
                  }
                  setState(() {});
                },
                child: Container(
                  width: 35,
                  height: 40,
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: sizes[i] ? AppColors.jeansColor : Colors.transparent,
                    border: Border.all(color: AppColors.jeansColor, width: 0.5)
                  ),
                  child: Text(i, style: sizes[i] ? AppFonts.miniWhiteStyle : AppFonts.miniBlackStyle),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  buildColorsSection() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select Color', style: AppFonts.subBlackStyle),
          Row(
            children: [
              for (int i = 0; i < colors.length; i++)
              InkWell(
                onTap: () {
                  colors[i]['isSelected'] = !colors[i]['isSelected'];
                  for (int x = 0; x < colors.length; x++) {
                    if (colors[x]['name'] != colors[i]['name']) {
                      colors[x]['isSelected'] = false;
                    }
                  }
                  setState(() {});
                },
                child: Container(
                  width: 35,
                  height: 40,
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: colors[i]['color'],
                    shape: BoxShape.circle
                  ),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colors[i]['isSelected'] ? Colors.white : Colors.transparent
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}