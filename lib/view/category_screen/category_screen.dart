import 'package:flutter/material.dart';
import 'package:zzazzo_test_jubayer/common_widgets/custom_bottom_app_bar.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:zzazzo_test_jubayer/view/category_screen/custom_app_bar_category_screen.dart';

import 'category_background_screen.dart';

class CategoryScreen extends StatelessWidget {
  String? categoryName;
  CategoryScreen({required this.categoryName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        onPressed: () {},
        child: const Icon(Icons.add_shopping_cart_outlined,color: Colors.white,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: CustomAppBarCategoryScreen()),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                backgroundShadowColor.shade100,
                secondaryBackgroundShadowColor.shade50
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
            child: Column(
              children: [
                Text("Category Page",
                    style: CustomFontStyle.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
                CategoryBackGroundScreen(
                  categoryName: categoryName,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
