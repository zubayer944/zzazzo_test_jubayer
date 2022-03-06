import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zzazzo_test_jubayer/helper/api_url.dart';
import 'package:zzazzo_test_jubayer/model/home_product_model.dart';

class HomeProductRepository {
  Future<List<ProductModel>> getAllProduct() async {
    try {
      List<ProductModel> productList = <ProductModel>[];
      Uri url = Uri.parse(ApiUrls.homePage);
      final http.Response response = await http.get(
        url,
      );
      print('HomeProductRepository.getAllProduct response body : ' +
          response.body.toString());
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        print('HomeProductRepository.getAllProduct response body : ' +
            response.statusCode.toString());
        var jsonMap = jsonDecode(response.body);
        for (var product in jsonMap) {
          productList.add(ProductModel.fromJson(product));
          print('HomeProductRepository.getAllProduct list length : ' +
              productList.length.toString());
        }
        print('HomeProductRepository.getAllProduct return length : ' +
            productList.length.toString());
        return productList;
      } else {
        return [];
      }
    } catch (e) {
      print('HomeProductRepository.getAllProduct error : ' + e.toString());
      return [];
    }
  }

  Future<List<String>> getAllCategory() async {
    try {
      List<String> categoryList = <String>[];
      Uri url = Uri.parse(ApiUrls.getAllCategory);
      final http.Response response = await http.get(
        url,
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        var jsonMap = jsonDecode(response.body);
        for (var category in jsonMap) {
          categoryList.add(category);
        }
        return categoryList;
      } else {
        return [];
      }
    } catch (e) {
      print('HomeProductRepository.categoryList error : ' + e.toString());
      return [];
    }
  }
}
