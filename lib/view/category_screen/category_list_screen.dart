import 'package:Jubayer_Bin_Montasir/common_widgets/common_network_image.dart';
import 'package:Jubayer_Bin_Montasir/common_widgets/font_style.dart';
import 'package:Jubayer_Bin_Montasir/controller/all_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'category_product_item_screen.dart';

class CategoryListScreen extends StatelessWidget {
  String categoryList;
  CategoryListScreen({required this.categoryList, Key? key}) : super(key: key);
  final AllCategoryController _allCategoryController = Get.put(AllCategoryController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _allCategoryController.getAllCategoryWiseProduct(
            categoryName: categoryList);
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonNetworkImages().cachedNetworkImages(
                height: 20,
                width: 20,
                imgUrl:
                    "https://cdn.pixabay.com/photo/2014/12/08/14/23/pocket-watch-560937_960_720.jpg",
                radiusCorner: 25.0,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "$categoryList",
                style: CustomFontStyle.poppins(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
