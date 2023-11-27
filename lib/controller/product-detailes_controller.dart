import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class ProductDetailesController extends GetxController {
  goToProduct();
}

class ProductDetailesControllerImpl extends ProductDetailesController {
  @override
  goToProduct() {
    Get.toNamed(AppRouts.productPage);
  }
}
