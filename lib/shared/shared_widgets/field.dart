import 'package:ecommerce/shared/shared_theme/app_colors.dart';
import 'package:ecommerce/shared/shared_theme/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


field({required String label, required IconData icon, required TextEditingController controller, required TextInputType textInputType, required TextInputAction textInputAction,
  Widget suffixIcon = const SizedBox(), bool isSecure = false, List<TextInputFormatter> formaters = const [], bool isEnabled = true
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      border: _inputBorder(AppColors.greyColor),
      focusedBorder: _inputBorder(AppColors.greyColor),
      errorBorder: _inputBorder(Colors.red),
      focusedErrorBorder: _inputBorder(Colors.red),
      labelText: label,
      labelStyle: AppFonts.subGreyStyle,
      prefixIcon: Icon(icon, color: AppColors.greyColor, size: 20.0),
      suffixIcon: suffixIcon,
    ),
    obscureText: isSecure,
    textInputAction: textInputAction,
    keyboardType: textInputType,
    inputFormatters: formaters,
    enabled: isEnabled,
  );
}

OutlineInputBorder _inputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: BorderSide(color: color, width: 0.5)
  );
}