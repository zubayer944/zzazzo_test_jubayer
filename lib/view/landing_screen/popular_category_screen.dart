import 'package:flutter/material.dart';
import 'package:zzazzo_test_jubayer/common_widgets/common_network_image.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';
import 'package:zzazzo_test_jubayer/helper/colors.dart';

class PopularCategoryScreen extends StatelessWidget {
  const PopularCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 300,
          height: 120,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          foregroundDecoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [categoryShadowColor, Colors.transparent],
          )),
          child: CommonNetworkImages().cachedNetworkImages(
              imgUrl:
                  "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fearpod&psig=AOvVaw1gILoZxR9oiJQZnHrS-6g3&ust=1646564849541000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCIDcu53qrvYCFQAAAAAdAAAAABAD",
              radiusCorner: 20.0),
        ),
        Positioned(
            top: 50,
            left: 20,
            child: Text(
              "Apple",
              style: CustomFontStyle.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ))
      ],
    );
  }
}
