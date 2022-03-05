import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ProductDetailsBackgroundScreen extends StatelessWidget {
  const ProductDetailsBackgroundScreen({Key? key}) : super(key: key);

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
              ],
            ),
          )),
    );
  }

  Widget _categoryBackgroundAppBar() {
    return Row(
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
        const Expanded(
            flex: 1,
            child: Icon(
              Icons.favorite_rounded,
              color: Colors.red,
            )),
      ],
    );
  }
  Widget _coverImageWidget(List<String> value) {
    Size _size = Get.size;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: _size.height / 3,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                // _productDetailsController.sliderImageIndex.value = index;
              }),
          items: value.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.all(const Radius.circular(15)),
              child: FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                image: ExtendedNetworkImageProvider(
                  url,
                  cache: true,
                ),
                placeholder: AssetImage(''),
                placeholderErrorBuilder: (context, widget, stacktrace) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                },
                imageErrorBuilder: (context, widget, stacktrace) {
                  return Center(
                    child: Image.asset('assets/download.jpg'),
                  );
                },
              ),
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          left: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              value.length,
                  (index) => buildDot(index: index),
            ),
          ),
        ),
      ],
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      // width: _productDetailsController.sliderImageIndex.value == index ? 20 : 6,
      decoration: BoxDecoration(
        // color: _productDetailsController.sliderImageIndex.value == index
        //     ? primaryColor
        //     : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
