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
      child: Icon(Icons.arrow_back, color: AppColors.jeansColor, size: 25.0),
    );
  }
}