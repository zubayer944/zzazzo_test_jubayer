import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/common_network_image.dart';
import 'package:zzazzo_test_jubayer/common_widgets/custom_elevated_button.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:zzazzo_test_jubayer/view/category_screen/category_screen.dart';

class DailyProductScreen extends StatelessWidget {
  const DailyProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Get.to(CategoryScreen());},
      child: SizedBox(
        height: 300,
        width: 255,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CommonNetworkImages().cachedNetworkImages(
                          imgUrl:
                              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.bbc.com%2Fnews%2Ftechnology-58560011&psig=AOvVaw1g1cM3xntsdGFNFuYKQViE&ust=1646550586617000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCNDK7oi1rvYCFQAAAAAdAAAAABAJ',
                          radiusCorner: 0.0),
                    ),
                  ],
                ),
              ),
              Positioned(top: 25, child: offerPercentage()),
              Positioned(top: 150, child: _addToCartAndFav()),
            ],
          ),
        ),
      ),
    );
  }

  Widget offerPercentage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: 55,
      decoration: const BoxDecoration(
        color: offerBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Text(
        "- 20%",
        style: CustomFontStyle.poppins(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _addToCartAndFav() {
    return Container(
      width: 245,
      padding: const EdgeInsets.all(8),
      color: Colors.white.withOpacity(0.9),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButtton().customElevatedButton(
                  onTap: () {},
                  height: 45,
                  btnName: "Add to cart",
                  btnTxtColor: addToCartBtnTextColor,
                  iconColor: addToCartBtnTextColor,
                  icon: Icons.shopping_cart,
                  btnBackgroundColor: addToCartBtnTextColor.withOpacity(0.2)),
              const SizedBox(
                width: 10,
              ),
              CustomElevatedButtton().customElevatedButton(
                  onTap: () {},
                  height: 45,
                  btnName: "",
                  icon: Icons.favorite_border,
                  iconColor: offerBackgroundColor,
                  btnBackgroundColor: offerBackgroundColor.withOpacity(0.2))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "One Plus 7T Dual Sim 8GB Ram 128Gb LTE Frosted Silver",
            textAlign: TextAlign.center,
            style: CustomFontStyle.poppins(fontWeight: FontWeight.w500),
          ),
          Text(
            '\$ 953.00',
            style: CustomFontStyle.poppins(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
