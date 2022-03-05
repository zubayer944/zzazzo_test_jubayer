import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:zzazzo_test_jubayer/view/product_details_screen/product_details_background_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size size = Get.size;
    return Scaffold(
     backgroundColor: Colors.grey,
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
         child: Column(
           children: [
             Text("Product Details",
                 style: CustomFontStyle.poppins(
                   fontSize: 24,
                   fontWeight: FontWeight.w500,
                 )),
             const ProductDetailsBackgroundScreen()
           ],
         ),
       ),
     ),
   );
  }

}
