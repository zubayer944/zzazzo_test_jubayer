import 'package:Jubayer_Bin_Montasir/common_widgets/font_style.dart';
import 'package:Jubayer_Bin_Montasir/helper/colors.dart';
import 'package:Jubayer_Bin_Montasir/view/product_details_screen/product_details_background_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductDetailsScreen extends StatelessWidget {

  int?productId;
  ProductDetailsScreen({required this.productId, Key? key})
      : super(key: key);

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
                ProductDetailsBackgroundScreen(
                 productId: productId,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
