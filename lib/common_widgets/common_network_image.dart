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
      placeholder: (context, url) => Container(
        padding: const EdgeInsets.all(5),
        child:  Center(
          child: Container(
            // height: 220,
            //   width: 150,
              child: CircularProgressIndicator()),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: errorHeight,//220
        width: errorWidth,//200
        decoration: BoxDecoration(
          // image: DecorationImage( fit: BoxFit.cover, image: ),
          borderRadius: BorderRadius.all(
            Radius.circular(radiusCorner!),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.asset(
              "assets/icons/nope_not_here.png",
              height: height,
              width: width,
              gaplessPlayback: true,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
