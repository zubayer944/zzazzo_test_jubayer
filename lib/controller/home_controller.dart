import 'package:Jubayer_Bin_Montasir/model/home_product_model.dart';
import 'package:Jubayer_Bin_Montasir/repository/home_page_repository.dart';
import 'package:get/get.dart';



class HomeController extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;
  RxBool productDataLoaded = false.obs;
  RxInt sliderIndex = 0.obs;

  RxList<String> categoryList = <String>[].obs;
  RxBool categoryDataLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllProduct();
    getAllCategory();
  }

  void getAllProduct() {
    try {
      HomeProductRepository()
          .getAllProduct()
          .then((List<ProductModel> responseData) {
        productList.clear();
        productList.addAll(responseData);
        productDataLoaded.value = true;
      });
    } catch (e) {
      Get.snackbar("Error", "Something wrong");
    }
  }

  void getAllCategory() {
    try {
      HomeProductRepository()
          .getAllCategory()
          .then((List<String> responseData) {
        categoryList.clear();
        categoryList.addAll(responseData);
        categoryDataLoaded.value = true;
      });
    } catch (e) {
      Get.snackbar("Error", "Something wrong");
    }
  }
}
