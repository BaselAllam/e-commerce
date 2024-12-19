import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';


snack({required String txt, Color color = Colors.red}) {
  return SnackBar(
    content: Text(txt, style: AppFonts.subWhiteStyle),
    duration: Duration(seconds: 3),
    backgroundColor: color,
  );
}