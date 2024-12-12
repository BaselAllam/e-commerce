import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:flutter/material.dart';


class BackBtn extends StatefulWidget {
  const BackBtn({super.key});

  @override
  State<BackBtn> createState() => _BackBtnState();
}

class _BackBtnState extends State<BackBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.blackColor, width: 0.5),
          shape: BoxShape.circle
        ),
        child: Icon(Icons.arrow_back_ios, color: AppColors.blackColor, size: 20.0),
      ),
    );
  }
}