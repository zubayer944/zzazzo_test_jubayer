import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:zzazzo_test_jubayer/view/category_screen/category_list_screen.dart';

import 'category_product_item_screen.dart';

class CategoryBackGroundScreen extends StatelessWidget {
  const CategoryBackGroundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Center(
      child: Container(
        // height: size.height,
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
                _categoryBackgroundAppBar(),
                const SizedBox(
                  height: 25,
                ),
                _categoryHeader(),
                const SizedBox(
                  height: 20,
                ),
                categoryListBuildBody(),
                const SizedBox(
                  height: 20,
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
              style: CustomFontStyle.poppins(fontSize: 20),
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
          // decoration: const InputDecoration(
          //     disabledBorder: InputBorder.none,
          //   ),
          value: 1,
          onChanged: (int) {},
          items:  <DropdownMenuItem<int>>[
            DropdownMenuItem<int>(
              value: 1,
              child: Text("Sort by",style: CustomFontStyle.poppins(
                color: searchBoxBackgroundColor,
              ),),
            ),
            const DropdownMenuItem<int>(
              value: 2,
              child: Text("Sort by2"),
            ),
          ],
        ));
  }

  Widget categoryListBuildBody(){
    return SizedBox(
      height: 40,
      width: 355,
      child: ListView.builder(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context,i){
        return  const CategoryListScreen();
      }),
    );
  }

  Widget _categoryProductItemBuildBody(){
    Size size = Get.size;
    return  SizedBox(
      height: size.height,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount:5,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (context, i) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.0,vertical: 10),
            child: CategoryProductItemScreen(),
          );
        },
      ));

  }

}
