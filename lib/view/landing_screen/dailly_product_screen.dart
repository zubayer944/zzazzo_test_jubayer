import 'package:Jubayer_Bin_Montasir/common_widgets/custom_elevated_button.dart';
import 'package:Jubayer_Bin_Montasir/common_widgets/font_style.dart';
import 'package:Jubayer_Bin_Montasir/helper/colors.dart';
import 'package:Jubayer_Bin_Montasir/model/home_product_model.dart';
import 'package:Jubayer_Bin_Montasir/view/product_details_screen/product_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DailyProductScreen extends StatelessWidget {
  ProductModel productModel = ProductModel();
  DailyProductScreen({required this.productModel, Key? key}) : super(key: key);
  final Size size = Get.size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to( ProductDetailsScreen(productId: productModel.id,));
      },
      child: SizedBox(
        width: 265,
        child: Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CachedNetworkImage(
                      imageUrl: "${productModel.image}",
                      height: size.height * 0.35,
                            width: size.width*0.45,
                    ),
                        )),
                  ],
                ),
              ),
              Positioned(top: 25, child: offerPercentage()),
              Positioned(
                  left: 10,
                  top: 170, child: _addToCartAndFav()),
            ],
          ),
        ),
      ),
    );
  }

  Widget offerPercentage() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: 55,
      decoration: const BoxDecoration(
        color: offerBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
      ),
      child: Text(
        "- 20%",
        style: CustomFontStyle.poppins(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _addToCartAndFav() {
    return Container(
      width: 245,
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      color: Colors.white.withOpacity(0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(

            children: [
              CustomElevatedButton().customElevatedButton(
                  onTap: () {},
                  height: 45,
                  btnName: "Add to cart",
                  btnTxtColor: addToCartBtnTextColor,
                  iconColor: addToCartBtnTextColor,
                  icon: Icons.shopping_cart,
                  btnBackgroundColor: addToCartBtnTextColor.withOpacity(0.2)),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    //TODO
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      primary: offerBackgroundColor.withOpacity(0.2)),
                  child: const Center(
                    child: Icon(
                      Icons.favorite_border,
                      color: offerBackgroundColor,
                    ),
                  ),
                ),
              )

            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${productModel.title}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomFontStyle.poppins(fontWeight: FontWeight.w500),
          ),
          Text(
            '\$ ${productModel.price}',
            style: CustomFontStyle.poppins(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
