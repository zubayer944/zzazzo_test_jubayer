import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:zzazzo_test_jubayer/model/AllCategoryModel.dart';
import 'package:zzazzo_test_jubayer/view/product_details_screen/product_details_screen.dart';

class CategoryProductItemScreen extends StatelessWidget {
  CategoryWiseProductModel allCategoryProductModel = CategoryWiseProductModel();
  CategoryProductItemScreen({required this.allCategoryProductModel, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            // Get.to(ProductDetailsScreen(productModel: ,));
          },
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl: "${allCategoryProductModel.image}",
                    height: 150,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${allCategoryProductModel.title}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: CustomFontStyle.poppins(fontSize: 14),
                  ),
                  Text(
                    "\$ ${allCategoryProductModel.price}",
                    style: CustomFontStyle.poppins(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  _ratingBar(),
                  // const SizedBox(height: 5,)
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 15,
            left: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              // width: 55,
              decoration: BoxDecoration(
                color: addToCartBtnTextColor.withOpacity(0.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              child: Text(
                "20%",
                style: CustomFontStyle.poppins(
                  color: categoryShadowColor,
                ),
              ),
            )),
        Positioned(
            top: 15,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              // width: 55,
              decoration: const BoxDecoration(
                color: offerBackgroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: const Icon(
                Icons.favorite_outlined,
                color: favouriteCategoryColor,
                size: 18,
              ),
            )),
      ],
    );
  }

  Widget _ratingBar() {
    return Container(
      padding: const EdgeInsets.all(5),
      width: 170,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          allCategoryProductModel.rating!.rate == null
              ? Container()
              : RatingBar.builder(
                  itemSize: 13,
                  initialRating: double.parse(
                      allCategoryProductModel.rating!.rate.toString()),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //TODO
                  },
                ),
          const SizedBox(
            width: 5,
          ),
          Text("(${allCategoryProductModel.rating!.count})"),
        ],
      ),
    );
  }
}
