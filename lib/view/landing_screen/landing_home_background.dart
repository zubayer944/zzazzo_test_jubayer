import 'package:Jubayer_Bin_Montasir/common_widgets/font_style.dart';
import 'package:Jubayer_Bin_Montasir/controller/home_controller.dart';
import 'package:Jubayer_Bin_Montasir/helper/colors.dart';
import 'package:Jubayer_Bin_Montasir/view/landing_screen/popular_category_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dailly_product_screen.dart';

class LandingHomeBackground extends StatelessWidget {
  LandingHomeBackground({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  final Size size = Get.size;

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Center(
      child: Container(
          // height: size.height * 1,
          width: size.width * 1,
          decoration: const BoxDecoration(
            color: txtBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _homeProfileView(),
                  const SizedBox(
                    height: 25,
                  ),
                  _searchTextBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  _dailyProductDealsBuildBody(),
                  const SizedBox(
                    height: 30,
                  ),
                  _popularCategoryBuildBody()
                ],
              ))),
    );
  }

  Widget _homeProfileView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Good Morning",
                  style: CustomFontStyle.poppins(
                      color: searchBoxBackgroundColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Jubayer Bin Montasir",
                  style: CustomFontStyle.poppins(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
              ],
            )
          ],
        ),
        const Icon(Icons.menu)
      ],
    );
  }

  Widget _searchTextBox() {
    return Container(
        height: 45,
        width: 350,
        decoration: BoxDecoration(
          color: searchBoxBackgroundColor.withOpacity(0.3),
          // border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          textAlign: TextAlign.start,
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "Search product you wish",
              hintStyle: TextStyle(),
              prefixIcon: Icon(Icons.search)),
        ));
  }

  Widget _productsHeader({String? itemName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          itemName.toString(),
          style: CustomFontStyle.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        _productCountDotted(),
      ],
    );
  }

  Widget _productCountDotted() {
    Size size = Get.size;
    return SizedBox(
      height: 10,
      width: 65,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                      color: searchBoxBackgroundColor,
                      shape: BoxShape.circle //This will make container round
                      )),
            );
          }),
    );
  }

  Widget _dailyProductDealsBuildBody() {
    return Obx(() {
      if (_homeController.productDataLoaded.value == false) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_homeController.productDataLoaded.value == true &&
          _homeController.productList.isEmpty) {
        return const Center(
          child: Text("No Product Found"),
        );
      } else {
        return Column(
          children: [
            _productsHeader(
              itemName: "Daily deals",
            ),
            const SizedBox(
              height: 10,
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: size.width * 0.80,
                  autoPlay: true,
                  viewportFraction: 0.75,
                  onPageChanged: (index, reason) {
                    _homeController.sliderIndex.value = index;
                  }),
              items: _homeController.productList.map((url) {
                return DailyProductScreen(productModel: url);
              }).toList(),
            ),
          ],
        );
      }
    });
  }

  Widget _popularCategoryBuildBody() {
    return Obx(() {
      if (_homeController.categoryDataLoaded.value == false) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_homeController.categoryDataLoaded.value == true &&
          _homeController.categoryList.isEmpty) {
        return const Center(
          child: Text("No Category Found"),
        );
      } else {
        return Column(
          children: [
            _productsHeader(
              itemName: "Popular Category",
            ),
            const SizedBox(
              height: 25,
            ),
            CarouselSlider(
              options: CarouselOptions(
                  height: size.height * 0.20,
                  autoPlay: true,
                  viewportFraction: 0.85,
                  onPageChanged: (index, reason) {
                    _homeController.sliderIndex.value = index;
                  }),
              items: _homeController.categoryList.map((url) {
                return PopularCategoryScreen(
                  categoryName: url,
                );
              }).toList(),
            ),
          ],
        );
      }
    });
  }
}
