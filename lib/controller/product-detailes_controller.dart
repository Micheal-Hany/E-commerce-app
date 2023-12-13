import 'dart:ffi';

import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class ProductDetailesController extends GetxController {
  goToProduct();
  backToHomePage();
}

class ProductDetailesControllerImpl extends ProductDetailesController {
  final RxInt counter = 0.obs;

  addOne() {
    counter.value += 1;
    update();
  }

  minusOne() {
    counter.value == 0 ? counter : counter.value -= 1;
    update();
  }

  final ProductModel product = Get.arguments;
  @override
  goToProduct() {
    Get.toNamed(AppRouts.productPage);
  }

  @override
  backToHomePage() {
    Get.back();
  }

  goToReviewPage() {
    Get.toNamed(AppRouts.reviewPage);
  }
}
