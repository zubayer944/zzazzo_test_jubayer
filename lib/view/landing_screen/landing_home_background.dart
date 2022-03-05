import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:zzazzo_test_jubayer/view/landing_screen/popular_category_screen.dart';
import 'dailly_product_screen.dart';

class LandingHomeBackground extends StatelessWidget {
  const LandingHomeBackground({Key? key}) : super(key: key);

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
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
                _productsHeader(
                  itemName:  "Daily Deals",
                ),
                const SizedBox(
                  height: 10,
                ),
                _dailyProductDealsBuildBody(),
                const SizedBox(
                  height: 20,
                ),
                _productsHeader(
                  itemName:  "Popular Category",
                ),
                const SizedBox(height: 15,),
                _popularCategoryBuildBody()
              ],
            ),
          )),
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
                      fontSize: 12, fontWeight: FontWeight.w500),
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
          color: searchBoxBackgroundColor,
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

  Widget _productsHeader({String?itemName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
        itemName.toString() ,
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
    return SizedBox(
      height: 295,
      width: 355,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, i) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: DailyProductScreen(),
            );
          }),
    );
  }

  Widget _popularCategoryBuildBody(){
    return SizedBox(height: 150,
    width: 355,
    child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,i){
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: PopularCategoryScreen(),
      );
    }),);
  }
}
