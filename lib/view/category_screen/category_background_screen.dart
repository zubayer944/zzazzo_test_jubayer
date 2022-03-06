import 'package:Jubayer_Bin_Montasir/common_widgets/font_style.dart';
import 'package:Jubayer_Bin_Montasir/controller/all_category_controller.dart';
import 'package:Jubayer_Bin_Montasir/controller/home_controller.dart';
import 'package:Jubayer_Bin_Montasir/helper/colors.dart';
import 'package:Jubayer_Bin_Montasir/model/AllCategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'category_list_screen.dart';
import 'category_product_item_screen.dart';

class CategoryBackGroundScreen extends StatelessWidget {
  final String? categoryName;
  CategoryBackGroundScreen({required this.categoryName, Key? key})
      : super(key: key);
  final AllCategoryController _allCategoryController =
      Get.put(AllCategoryController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    _allCategoryController.getAllCategoryWiseProduct(
        categoryName: categoryName);
    Size size = Get.size;
    return Center(
      child: Container(
          width: size.width * 1,
          decoration: const BoxDecoration(
            color: txtBackgroundColor,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _categoryBackgroundAppBar(),
                const SizedBox(
                  height: 25,
                ),
                _categoryHeader(),
                const SizedBox(
                  height: 20,
                ),
                _categoryListBuildBody(),
                const SizedBox(
                  height: 5,
                ),
                _categoryProductItemBuildBody(),
              ],
            ),
          )),
    );
  }

  Widget _categoryBackgroundAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Expanded(flex: 1, child: Icon(Icons.menu)),
        Expanded(
            flex: 8,
            child: Center(
                child: Text(
              "XE",
              style: CustomFontStyle.poppins(
                  fontSize: 20, fontWeight: FontWeight.w700),
            ))),
        const Expanded(flex: 1, child: Icon(Icons.search)),
      ],
    );
  }

  Widget _categoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Our Product",
          style: CustomFontStyle.poppins(
              fontSize: 24, fontWeight: FontWeight.w700),
        ),
        dropDown(titleText: "Sort by")
      ],
    );
  }

  Widget dropDown({
    String? titleText,
  }) {
    return SizedBox(
        width: 100.0,
        child: DropdownButton<int>(
          hint: const Text("Sort by"),
          underline: DropdownButtonHideUnderline(child: Container()),
          value: 1,
          onChanged: (int) {},
          items: <DropdownMenuItem<int>>[
            DropdownMenuItem<int>(
              value: 1,
              child: Text(
                "Sort by",
                style: CustomFontStyle.poppins(
                  color: searchBoxBackgroundColor,
                ),
              ),
            ),
            const DropdownMenuItem<int>(
              value: 2,
              child: Text("Sort by2"),
            ),
          ],
        ));
  }

  Widget _categoryListBuildBody() {
    return Obx(() {
      if (_homeController.categoryDataLoaded.value == false) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_homeController.categoryDataLoaded.value == true &&
          _homeController.categoryList.isEmpty) {
        return const Center(
          child: Text("No Data Found"),
        );
      } else {
        return SizedBox(
          height: 40,
          width: 355,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _homeController.categoryList.length,
              itemBuilder: (context, index) {
                return CategoryListScreen(
                  categoryList: _homeController.categoryList[index],
                );
              }),
        );
      }
    });
  }

  Widget _categoryProductItemBuildBody() {
    Size size = Get.size;
    return Obx(() {
      if (_allCategoryController.categoryWiseDataLoaded.value == false) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (_allCategoryController.categoryWiseDataLoaded.value == true &&
          _allCategoryController.allCategoryWiseProductList.isEmpty) {
        return const Center(
          child: Text("No Data Found"),
        );
      } else {
        return GridView.count(
          childAspectRatio: .60,
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 2.0,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          controller: ScrollController(keepScrollOffset: false),
          children: _allCategoryController.allCategoryWiseProductList
              .map((CategoryWiseProductModel value) {
            return CategoryProductItemScreen(
              allCategoryProductModel: value,
            );
          }).toList(),
        );
      }
    });
  }
}
