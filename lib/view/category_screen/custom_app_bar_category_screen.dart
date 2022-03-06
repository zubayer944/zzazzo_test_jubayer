import 'package:Jubayer_Bin_Montasir/view/landing_screen/landing_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CustomAppBarCategoryScreen extends StatelessWidget {
  const CustomAppBarCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            children: [
              MaterialButton(
                onPressed: () {},
                // minWidth: 40,
                child: const Icon(
                  Icons.favorite_rounded,
                  color: Colors.grey,
                ),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {},
                // minWidth: 40,
                child: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
