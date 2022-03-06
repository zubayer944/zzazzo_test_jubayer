import 'package:Jubayer_Bin_Montasir/common_widgets/font_style.dart';
import 'package:Jubayer_Bin_Montasir/helper/colors.dart';
import 'package:Jubayer_Bin_Montasir/view/category_screen/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PopularCategoryScreen extends StatelessWidget {
  String? categoryName;
  PopularCategoryScreen({required this.categoryName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: InkWell(
        onTap: () {
          Get.to(CategoryScreen(
            categoryName: categoryName,
          ));
        },
        child: Stack(
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/headphone.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              foregroundDecoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                    colors: [categoryShadowColor, Colors.transparent],
                  )),
            ),

            Positioned(
                top: 50,
                left: 20,
                child: Text(
                  "$categoryName",
                  style: CustomFontStyle.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
