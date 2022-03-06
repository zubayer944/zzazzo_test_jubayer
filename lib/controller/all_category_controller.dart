import 'package:get/get.dart';
import 'package:zzazzo_test_jubayer/model/AllCategoryModel.dart';
import 'package:zzazzo_test_jubayer/repository/category_product_repository.dart';

class AllCategoryController extends GetxController {
  RxList<CategoryWiseProductModel> allCategoryWiseProductList =
      <CategoryWiseProductModel>[].obs;
  RxBool categoryWiseDataLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void getAllCategoryWiseProduct({required String? categoryName}) {
    try {
      CategoryProductRepository()
          .getAllCategory(categoryName: categoryName!)
          .then((List<CategoryWiseProductModel> responseData) {
        allCategoryWiseProductList.clear();
        allCategoryWiseProductList.addAll(responseData);
        categoryWiseDataLoaded.value = true;
      });
    } catch (e) {
      Get.snackbar("Error", "Something wrong");
    }
  }
}
