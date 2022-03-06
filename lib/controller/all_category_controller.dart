import 'package:Jubayer_Bin_Montasir/model/AllCategoryModel.dart';
import 'package:Jubayer_Bin_Montasir/repository/category_product_repository.dart';
import 'package:get/get.dart';


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
