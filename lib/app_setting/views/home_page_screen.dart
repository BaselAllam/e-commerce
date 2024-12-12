import 'package:ecommerce/product/views/all_categories_screen.dart';
import 'package:ecommerce/product/views/search_result_screen.dart';
import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/notification_button.dart';
import 'package:ecommerce/shared/shared_widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


List products = [
    {
      'name': 'Jeans Jaket',
      'img': 'https://images.pexels.com/photos/1040945/pexels-photo-1040945.jpeg?auto=compress&cs=tinysrgb&w=800',
      'isFav': false,
      'price': 200,
      'rate': 4.9
    },
    {
      'name': 'Brown Jaket',
      'img': 'https://images.pexels.com/photos/842811/pexels-photo-842811.jpeg?auto=compress&cs=tinysrgb&w=800',
      'isFav': false,
      'price': 250,
      'rate': 4.5
    },
    {
      'name': 'Yellow TShirt',
      'img': 'https://images.pexels.com/photos/1018911/pexels-photo-1018911.jpeg?auto=compress&cs=tinysrgb&w=800',
      'isFav': false,
      'price': 150,
      'rate': 4.3
    },
    {
      'name': 'Black TShirt',
      'img': 'https://images.pexels.com/photos/3662357/pexels-photo-3662357.jpeg?auto=compress&cs=tinysrgb&w=800',
      'isFav': false,
      'price': 185,
      'rate': 4.5
    },
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

  Map filterCategory = {
    'All': false,
    'New': false,
    'Popular': false,
    'Men': false,
    'Women': false,
    'Kids': false
  };

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
                Icon(Icons.location_on, color: AppColors.jeansColor, size: 18,),
                Text('  Cairo, EG  ', style: AppFonts.primaryBlackStyle),
                Icon(Icons.arrow_drop_down, color: AppColors.jeansColor),
              ],
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          NotificationButton()
        ],
      ),
      body: ListView(
        children: [
          buildBannerSection(),
          ListTile(
            title: Text('  Category', style: AppFonts.primaryBlackStyle),
            trailing: Text('see all  ', style: AppFonts.subGreyStyle),
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => AllCategoriesScreen()));
            },
          ),
          buildCategorySection(),
          flashSaleSectionHeader(),
          categoryFilterSection(),
          productsSection()
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
            onTap: () {
              Navigator.push(context, CupertinoPageRoute(builder: (_) => SearchResultScreen(screenTitle: categories[i]['title'])));
            },
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
                    child: Icon(categories[i]['icon'], color: AppColors.jeansColor, size: 50.0)
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

  flashSaleSectionHeader() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Flash Sale', style: AppFonts.primaryBlackStyle),
          Row(
            children: [
              Text('Closing in: ', style: AppFonts.subGreyStyle),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: AppColors.whiteColor
                ),
                child: Text('2', style: AppFonts.subJeansStyle),
              ),
              Text(' : ', style: AppFonts.subGreyStyle),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: AppColors.whiteColor
                ),
                child: Text('15', style: AppFonts.subJeansStyle),
              ),
              Text(' : ', style: AppFonts.subGreyStyle),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: AppColors.whiteColor
                ),
                child: Text('10', style: AppFonts.subJeansStyle),
              ),
            ],
          )
        ],
      ),
    );
  }

  categoryFilterSection() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (String key in filterCategory.keys)
          InkWell(
            onTap: () {
              filterCategory[key] = !filterCategory[key];
              for (String k in filterCategory.keys) {
                if (k != key) {
                  filterCategory[k] = false;
                }
              }
              setState(() {});
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: filterCategory[key] ? AppColors.jeansColor : Colors.transparent,
                    border: Border.all(color: AppColors.jeansColor, width: 0.5)
                  ),
                  height: 40.0,
                  alignment: Alignment.center,
                  child: Text(key, style:filterCategory[key] ? AppFonts.subWhiteStyle : AppFonts.subJeansStyle),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  productsSection() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          for (int i = 0; i < products.length; i++)
          ProductWidget(productData: products[i])
        ],
      ),
    );
  }
}