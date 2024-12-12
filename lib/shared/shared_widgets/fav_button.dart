import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:flutter/material.dart';

class FavButton extends StatefulWidget {
  Map<String, dynamic> productData;
  FavButton({required this.productData});

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        shape: BoxShape.circle
      ),
      child: IconButton(
        icon: Icon(widget.productData['isFav'] ? Icons.favorite : Icons.favorite_border),
        color: AppColors.jeansColor,
        iconSize: 20.0,
        onPressed: () {
          widget.productData['isFav'] = !widget.productData['isFav'];
          setState(() {});
        },
      ),
    );
  }
}