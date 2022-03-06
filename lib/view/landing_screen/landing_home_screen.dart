import 'package:Jubayer_Bin_Montasir/common_widgets/custom_bottom_app_bar.dart';
import 'package:Jubayer_Bin_Montasir/common_widgets/font_style.dart';
import 'package:Jubayer_Bin_Montasir/helper/colors.dart';
import 'package:flutter/material.dart';

import 'landing_home_background.dart';

class LandingHomeScreen extends StatelessWidget {
   LandingHomeScreen({Key? key}) : super(key: key);

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
              Text("Landing Home Page",
                  style: CustomFontStyle.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
               LandingHomeBackground()
            ],
          ),
        ),
      ),
    );
  }
}
