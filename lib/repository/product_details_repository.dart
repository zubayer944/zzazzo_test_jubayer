import 'dart:convert';
import 'package:Jubayer_Bin_Montasir/helper/api_url.dart';
import 'package:Jubayer_Bin_Montasir/model/product_details_model.dart';
import 'package:http/http.dart' as http;


class ProductDetailsRepository {
  Future<ProductDetailsModel?> getProductDetailsById(
      {required int productId}) async {
    try {
      Uri url = Uri.parse(ApiUrls.getProductDetails + productId.toString());
      final response = await http.get(
        url,
      );
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        ProductDetailsModel productDetailsModel =
            ProductDetailsModel.fromJson(jsonDecode(response.body));
        return productDetailsModel;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
