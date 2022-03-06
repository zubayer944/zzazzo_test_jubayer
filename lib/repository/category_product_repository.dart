import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:zzazzo_test_jubayer/helper/api_url.dart';
import 'package:zzazzo_test_jubayer/model/AllCategoryModel.dart';
import 'package:zzazzo_test_jubayer/model/home_product_model.dart';

class CategoryProductRepository {
  Future<List<CategoryWiseProductModel>> getAllCategory(
      {required String categoryName}) async {
    try {
      List<CategoryWiseProductModel> categoryProductsList =
          <CategoryWiseProductModel>[];
      Uri url = Uri.parse(ApiUrls.getAllTypeCategory + categoryName);
      final http.Response response = await http.get(
        url,
      );

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        var jsonMap = jsonDecode(response.body);
        for (var category in jsonMap) {
          categoryProductsList.add(CategoryWiseProductModel.fromJson(category));
        }

        return categoryProductsList;
      } else {
        return [];
      }
    } catch (e) {
      print('CategoryProductRepository.getAllProduct error : ' + e.toString());
      return [];
    }
  }
}
