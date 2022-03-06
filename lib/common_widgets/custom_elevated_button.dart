import 'package:Jubayer_Bin_Montasir/common_widgets/font_style.dart';
import 'package:flutter/material.dart';


class CustomElevatedButton {
  Widget customElevatedButton(
      {double? height,
      double? width,
      String? btnName,
      required VoidCallback onTap,
      Color? iconColor,
      Color? btnTxtColor,
      IconData? icon,
      Color? btnBackgroundColor}) {
    return SizedBox(
      height: height,
      child: ElevatedButton.icon(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: btnBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        icon: Center(
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        label: btnName == ""
            ? const SizedBox()
            : Text(
                btnName.toString(),
                style: CustomFontStyle.poppins(
                    color: btnTxtColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
      ),
    );
  }
}
