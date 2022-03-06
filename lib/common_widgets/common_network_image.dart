import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CommonNetworkImages {
  Widget cachedNetworkImages(
      {required String imgUrl,
      double? height,
      double? width,
      double? radiusCorner,
      double?errorHeight,
      double?errorWidth}) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          borderRadius: BorderRadius.all(
            Radius.circular(radiusCorner!),
          ),
          color: Colors.redAccent,
        ),
      ),
      //TODO NEED to set proper placeholder
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
