import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _categoryBackgroundAppBar(),

                Container(
                  height: 400,
                  width: 300,
                  color: Colors.red,
                ),
                const SizedBox(
                  height: 10,
                ),
                _productVariation(),
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
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                image: ExtendedNetworkImageProvider(
                  url,
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
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(right: 5),
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

  Widget _productVariation(){
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            topLeft: Radius.circular(40.0),

      ),),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Nike Air Max 200",style: CustomFontStyle.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w700
              ),),
              _ratingBar(),

            ],
          ),
          const SizedBox(height: 10,),
          const Text("Built for natural motion,the nike@ flex shoes"),
          const SizedBox(height: 20,),
          Row(
            children: [
              const Text("Size :"),
              _sizeBuildBody(),

            ],
          ),
          SizedBox(height: 20,),
          Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Available Color :"),
              _colorBuildBody(),
            ],
          )


        ],
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
  Widget _sizeBuildBody(){
    return SizedBox(
      height: 80,
      width: 285,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context,i){
        return _sizeUi();
      }),
    );
  }
  Widget _sizeUi(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children:  [
          Container(
            decoration:  BoxDecoration(
              color: addToCartBtnTextColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child:Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text("US 6",style: CustomFontStyle.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
              ),),
            ),
          ),

        ],
      ),
    );
  }
  Widget _colorBuildBody(){
    return SizedBox(
      height: 50,
      width: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context,i){
        return  colors();
      }),
    );
  }

  Widget colors(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          Container(
            height: 20,
            width: 20,
            decoration:  BoxDecoration(
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
            decoration:  const BoxDecoration(
              color: addToCartBtnTextColor,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),

          ),)
        ],
      ),
    );
  }


}
