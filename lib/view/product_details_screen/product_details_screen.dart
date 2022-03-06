import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/custom_elevated_button.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:zzazzo_test_jubayer/model/home_product_model.dart';
import 'package:zzazzo_test_jubayer/view/product_details_screen/product_details_background_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductModel productModel = ProductModel();
   ProductDetailsScreen({required this.productModel,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
    backgroundColor: secondaryBackgroundShadowColor.shade50,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
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
                Text("Product Details",
                    style: CustomFontStyle.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    )),
                 ProductDetailsBackgroundScreen(productModel: productModel,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  _customBottomNavigationBar() {
    Size size = Get.size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        height: 80,
        width: 320,
        decoration: const BoxDecoration(
          color: txtBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ 269",
                style: CustomFontStyle.poppins(
                    fontSize: 24, fontWeight: FontWeight.w700),
              ),
              CustomElevatedButton().customElevatedButton(
                  onTap: () {},
                  btnName: "Add to cart",
                  btnBackgroundColor: Colors.grey,
                  btnTxtColor: Colors.black,
                  icon: Icons.shopping_cart,
                  iconColor: Colors.black,
                  height: 50)
            ],
          ),
        ),
      ),
    );
  }
}
