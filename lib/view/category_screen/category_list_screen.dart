import 'package:flutter/material.dart';
import 'package:zzazzo_test_jubayer/common_widgets/common_network_image.dart';
import 'package:zzazzo_test_jubayer/common_widgets/font_style.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CommonNetworkImages().cachedNetworkImages(
                height: 20,
                width: 20,
                imgUrl:
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Funsplash.com%2Fs%2Fphotos%2Fmen-watch&psig=AOvVaw2tFxE5a2CuOnY-4wp7U_9r&ust=1646569659913000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCJjgvI_8rvYCFQAAAAAdAAAAABAD",
                radiusCorner: 0.0,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "BackPack",
                style: CustomFontStyle.poppins(fontWeight: FontWeight.w500),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
