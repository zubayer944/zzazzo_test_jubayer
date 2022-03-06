import 'package:Jubayer_Bin_Montasir/model/product_details_model.dart';
import 'package:Jubayer_Bin_Montasir/repository/product_details_repository.dart';
import 'package:get/get.dart';



class ProductDetailsController extends GetxController {
  Rx<ProductDetailsModel> productDetailsById = ProductDetailsModel().obs;
  RxBool productDetailsDataLoading = false.obs;
  RxInt sliderIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void userProfileGetMethod({required int productId}) async {
    try {
      productDetailsDataLoading.value = true;
      ProductDetailsRepository()
          .getProductDetailsById(productId: productId)
          .then((ProductDetailsModel? responseData) {
        productDetailsById.value = responseData!;
        productDetailsDataLoading.value = false;
      }).catchError((error) {});
    } catch (error) {
      Get.snackbar("Error", error.toString());
    }
  }
}
