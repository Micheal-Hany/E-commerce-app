import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class ProductDetailesController extends GetxController {
  goToProduct();
  backToHomePage();
}

class ProductDetailesControllerImpl extends ProductDetailesController {
  @override
  

  goToProduct() {
    Get.toNamed(AppRouts.productPage);
  }

  @override
  backToHomePage() {
    Get.back();
  }
}
