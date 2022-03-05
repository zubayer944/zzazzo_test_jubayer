import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/custom_bottom_app_bar.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:zzazzo_test_jubayer/view/landing_screen/landing_home_background.dart';

import 'category_background_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: floatingBackgroundColor,
        onPressed: () {},
        child: const Icon(Icons.mic),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: CustomBottomAppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
          child: Column(
            children: [
              Text("Category Page",
                  style: CustomFontStyle.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
              const CategoryBackGroundScreen()
            ],
          ),
        ),
      ),
    );
  }
}
