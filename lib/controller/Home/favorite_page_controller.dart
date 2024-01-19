import 'package:get/get.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class FavoriteController extends GetxController {
  backToHomePage();
}

class FavoriteControllerImpl extends FavoriteController {
  @override
  backToHomePage() {}
  List<ProductModel> products = [];
  StatusRequest stateRequest = StatusRequest.none;
  goToProductDetailes(ProductModel product) {
    Get.toNamed(AppRouts.productPage, arguments: product);
  }

  getLikedProducts() async {
    products = await DBHelper.instance().getAllProducts("Liked_Products");

    stateRequest = StatusRequest.loading;
    if (products.isEmpty) {
      stateRequest = StatusRequest.failure;
    } else {
      stateRequest = StatusRequest.success;
    }
    update();
  }

  remove(ProductModel product) async {
    await DBHelper.instance().deleteProduct("Liked_Products", product);
  }

  @override
  void onInit() {
    getLikedProducts();
    super.onInit();
  }
}
