import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imgs = [
    'https://images.pexels.com/photos/735551/pexels-photo-735551.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/2468789/pexels-photo-2468789.jpeg?auto=compress&cs=tinysrgb&w=800',
    'https://images.pexels.com/photos/5869617/pexels-photo-5869617.jpeg?auto=compress&cs=tinysrgb&w=800'
  ];

  List categories = [
    {
      'icon': Icons.pets,
      'title': 'Pets'
    },
    {
      'icon': Icons.bike_scooter,
      'title': 'Bikes'
    },
    {
      'icon': Icons.laptop,
      'title': 'Laptop'
    },
    {
      'icon': Icons.phone,
      'title': 'Mobiles'
    },
    {
      'icon': Icons.car_crash,
      'title': 'Cars'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location', style: AppFonts.subGreyStyle),
            Row(
              children: [
                Icon(Icons.location_on, color: AppColors.greenColor, size: 18,),
                Text('  Cairo, EG  ', style: AppFonts.primaryBlackStyle),
                Icon(Icons.arrow_drop_down, color: AppColors.greenColor),
              ],
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle
            ),
            child: IconButton(
              icon: Icon(Icons.notifications, color: AppColors.greenColor, size: 20.0,),
              onPressed: () {},
              ),
          )
        ],
      ),
      body: ListView(
        children: [
          buildBannerSection(),
          ListTile(
            title: Text('  Category', style: AppFonts.primaryBlackStyle),
            trailing: Text('see all  ', style: AppFonts.subGreyStyle),
            onTap: () {},
          ),
          buildCategorySection()
        ],
      ),
    );
  }

  buildBannerSection() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < imgs.length; i++)
          Container(
            height: 200,
            width: 400,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgs[i]),
                fit: BoxFit.fill
              ),
              borderRadius: BorderRadius.circular(20.0)
            ),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('New Collection', style: AppFonts.primaryBlackStyle),
                  Text('Discount 50% for', style: AppFonts.subGreyStyle),
                  Text('for the first transaction', style: AppFonts.subGreyStyle),
                ],
              ),
          ),
        ]
      ),
    );
  }

  buildCategorySection() {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (int i = 0; i < categories.length; i++)
          InkWell(
            onTap: () {},
            child: Container(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      shape: BoxShape.circle
                    ),
                    padding: EdgeInsets.all(10.0),
                    child: Icon(categories[i]['icon'], color: AppColors.greenColor, size: 50.0)
                  ),
                  SizedBox(height: 7),
                  Text(categories[i]['title'], style: AppFonts.subBlackStyle),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}