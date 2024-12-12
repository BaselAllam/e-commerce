import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:ecommerce/shared/shared_widgets/fav_button.dart';
import 'package:flutter/material.dart';


class ProductWidget extends StatefulWidget {
  Map<String, dynamic> productData;
  ProductWidget({required this.productData});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  image: NetworkImage(widget.productData['img']),
                  fit: BoxFit.fill
                )
              ),
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(10.0),
              child: FavButton(productData: widget.productData)
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.productData['name'], style: AppFonts.subBlackStyle),
                Text('⭐ ${widget.productData['rate']}', style: AppFonts.subGreyStyle),
              ],
            ),
            Text('${widget.productData['price']}EGP', style: AppFonts.subJeansStyle),
          ],
        ),
      ),
    );
  }
}