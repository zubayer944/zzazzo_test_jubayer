import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/custom_elevated_button.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/controller/home_controller.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:zzazzo_test_jubayer/model/home_product_model.dart';

class ProductDetailsBackgroundScreen extends StatelessWidget {
  ProductModel productModel = ProductModel();
  ProductDetailsBackgroundScreen({required this.productModel, Key? key})
      : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  Size size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          width: size.width * 1,
          decoration: const BoxDecoration(
            color: favouriteCategoryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _categoryBackgroundAppBar(),
              const SizedBox(
                height: 10,
              ),
              carouselImageForProductDetails(),
              const SizedBox(
                height: 10,
              ),
              _productVariation(context),
            ],
          )),
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
                style: CustomFontStyle.poppins(fontSize: 20),
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

  Widget carouselImageForProductDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: CarouselSlider(
        options: CarouselOptions(
            height: size.height * 0.50,
            autoPlay: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              _homeController.sliderIndex.value = index;
            }),
        items: _homeController.productList.map((url) {
          return _coverImageWidget(value: url);
        }).toList(),
      ),
    );
  }

  Widget _coverImageWidget({ProductModel? value}) {
    Size _size = Get.size;
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: FadeInImage(
            width: double.infinity,
            height: 300,
            fit: BoxFit.fitHeight,
            image: ExtendedNetworkImageProvider(
              "${value!.image}",
              cache: true,
            ),
            placeholder: const AssetImage(''),
            placeholderErrorBuilder: (context, widget, stacktrace) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            },
            imageErrorBuilder: (context, widget, stacktrace) {
              return Center(
                child: Image.asset('assets/icons/nope_not_here.png'),
              );
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _homeController.productList.length,
            (index) => buildDot(index: index),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      // width: _productDetailsController.sliderImageIndex.value == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _homeController.sliderIndex.value == index
            ? Colors.red
            : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  Widget _productVariation(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: Container(
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
                      "Nike Air Max 200",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: CustomFontStyle.poppins(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  _ratingBar(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Text("Built for natural motion,the nike@ flex shoes"),
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
            priceBar()
          ],
        ),
      ),
    );
  }

  Widget _ratingBar() {
    return Container(
      padding: const EdgeInsets.all(5),
      // width: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RatingBar.builder(
            itemSize: 10,
            initialRating: 3,
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
          const Text("(3.5)"),
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

  Widget priceBar() {
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
              "\$ 269",
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
