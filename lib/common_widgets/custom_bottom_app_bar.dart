import 'package:Jubayer_Bin_Montasir/view/landing_screen/landing_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  Get.to(LandingHomeScreen());
                },
                // minWidth: 40,
                child: const Icon(Icons.home),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {},
                // minWidth: 40,
                child: const Icon(Icons.add_shopping_cart),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
