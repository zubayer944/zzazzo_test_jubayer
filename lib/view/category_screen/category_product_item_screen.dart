import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/common_widgets/common_network_image.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';
import 'package:zzazzo_test_jubayer/view/product_details_screen/product_details_screen.dart';

class CategoryProductItemScreen extends StatelessWidget {
  const CategoryProductItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){Get.to(ProductDetailsScreen());},
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const SizedBox(
                //   height: 10,
                // ),
                CommonNetworkImages().cachedNetworkImages(
                    imgUrl:
                        "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fmen-watch&psig=AOvVaw2tFxE5a2CuOnY-4wp7U_9r&ust=1646569659913000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjgvI_8rvYCFQAAAAAdAAAAABAD",
                    height: 100,
                    width: 150,
                    errorHeight: 150,
                    errorWidth: 130,
                    radiusCorner: 0.0),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Nike Air Max 20",
                  style: CustomFontStyle.poppins(fontSize: 14),
                ),
                Text(
                  "\$ 240.00",
                  style: CustomFontStyle.poppins(
                      fontSize: 16, fontWeight: FontWeight.w700),
                ),
                _ratingBar(),
                // const SizedBox(height: 5,)
              ],
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
      padding: EdgeInsets.all(5),
      width: 170,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RatingBar.builder(
            itemSize: 15,
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
}
