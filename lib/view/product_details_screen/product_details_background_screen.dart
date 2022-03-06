import 'package:Jubayer_Bin_Montasir/common_widgets/custom_elevated_button.dart';
import 'package:Jubayer_Bin_Montasir/common_widgets/font_style.dart';
import 'package:Jubayer_Bin_Montasir/controller/product_details_controller.dart';
import 'package:Jubayer_Bin_Montasir/helper/colors.dart';
import 'package:Jubayer_Bin_Montasir/model/product_details_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';


class ProductDetailsBackgroundScreen extends StatelessWidget {
  int? productId;
  ProductDetailsBackgroundScreen({required this.productId, Key? key})
      : super(key: key);
  final ProductDetailsController _productDetailsController =
      Get.put(ProductDetailsController());
  Size size = Get.size;
  @override
  Widget build(BuildContext context) {
    _productDetailsController.userProfileGetMethod(productId: productId!);
    return Center(
      child: Container(
          width: size.width * 1,
          decoration: const BoxDecoration(
            color: favouriteCategoryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Obx(() {
            return _productDetailsController.productDetailsDataLoading.value ==
                    true
                ? Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _categoryBackgroundAppBar(),
                      const SizedBox(
                        height: 10,
                      ),
                      carouselImageForProductDetails(_productDetailsController
                          .productDetailsById.value.image),
                      const SizedBox(
                        height: 10,
                      ),
                      _productVariation(context,
                          _productDetailsController.productDetailsById.value),
                    ],
                  );
          })),
    );
  }

  Widget _categoryBackgroundAppBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 1,
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back))),
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                "XE",
                style: CustomFontStyle.poppins(
                    fontSize: 20, fontWeight: FontWeight.w700),
              ))),
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
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
            ),
          ),
        ],
      ),
    );
  }

  Widget carouselImageForProductDetails(String? imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: CachedNetworkImage(
        imageUrl: "$imageUrl",
        height: size.height * 0.35,
        width: size.width * 0.45,
      ),
    );
  }

  Widget _productVariation(BuildContext context, ProductDetailsModel value) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30.0),
          topLeft: Radius.circular(30.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24, top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180,
                  child: Text(
                    "${value.title}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: CustomFontStyle.poppins(
                        fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                ),
                _ratingBar(value),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Text(
              "${value.description}",
              maxLines: 2,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Text(
                  "Size :",
                  style: CustomFontStyle.poppins(
                    color: Colors.grey,
                  ),
                ),
                _sizeBuildBody(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Available Color :",
                  style: CustomFontStyle.poppins(
                    color: Colors.grey,
                  ),
                ),
                _colorBuildBody(),
              ],
            ),
          ),
          priceBar(value)
        ],
      ),
    );
  }

  Widget _ratingBar(ProductDetailsModel value) {
    return Container(
      padding: const EdgeInsets.all(5),
      // width: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RatingBar.builder(
            ignoreGestures: true,
            itemSize: 10,
            initialRating: value.rating!.rate,
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
          Text("(${value.rating!.count})"),
        ],
      ),
    );
  }

  Widget _sizeBuildBody() {
    return SizedBox(
      height: 80,
      width: 285,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, i) {
            return _sizeUi();
          }),
    );
  }

  Widget _sizeUi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: addToCartBtnTextColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "US 6",
                style: CustomFontStyle.poppins(
                    fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _colorBuildBody() {
    return SizedBox(
      height: 50,
      width: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, i) {
            return colors();
          }),
    );
  }

  Widget colors() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: addToCartBtnTextColor.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
            ),
          ),
          Positioned(
            top: 2.5,
            left: 2.4,
            child: Container(
              height: 15,
              width: 15,
              decoration: const BoxDecoration(
                color: addToCartBtnTextColor,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget priceBar(ProductDetailsModel value) {
    return Container(
      height: 100,
      // width: 350,
      decoration: const BoxDecoration(
        color: favouriteCategoryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ ${value.price}",
              style: CustomFontStyle.poppins(
                  fontSize: 24, fontWeight: FontWeight.w700),
            ),
            CustomElevatedButton().customElevatedButton(
                onTap: () {},
                btnName: "Add to cart",
                btnBackgroundColor: Colors.grey.shade400,
                btnTxtColor: Colors.black,
                icon: Icons.shopping_cart,
                iconColor: Colors.black,
                height: 50)
          ],
        ),
      ),
    );
  }
}
