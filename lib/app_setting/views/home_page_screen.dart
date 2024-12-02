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

  Map filterCategory = {
    'All': false,
    'New': false,
    'Popular': false,
    'Men': false,
    'Women': false,
    'Kids': false
  };

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
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle
            ),
            child: IconButton(
              icon: Icon(Icons.notifications, color: AppColors.jeansColor, size: 20.0,),
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
          InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.fromLTRB(10.0, 5, 0, 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: AppColors.whiteColor,
              ),
              padding: EdgeInsets.fromLTRB(10.0, 5, 8.0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                        image: NetworkImage(products[i]['img']),
                        fit: BoxFit.fill
                      )
                    ),
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle
                      ),
                      child: IconButton(
                        icon: Icon(products[i]['isFav'] ? Icons.favorite : Icons.favorite_border),
                        color: AppColors.jeansColor,
                        iconSize: 20.0,
                        onPressed: () {
                          products[i]['isFav'] = !products[i]['isFav'];
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(products[i]['name'], style: AppFonts.subBlackStyle),
                      Text('⭐ ${products[i]['rate']}', style: AppFonts.subGreyStyle),
                    ],
                  ),
                  Text('${products[i]['price']}EGP', style: AppFonts.subJeansStyle),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}