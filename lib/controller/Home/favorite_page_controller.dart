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

  getLikedProducts() async {
    products = await DBHelper.instance().getAllLikedProducts("Liked_Products");

    stateRequest = StatusRequest.loading;
    if (products.isEmpty) {
      stateRequest = StatusRequest.failure;
    } else {
      stateRequest = StatusRequest.success;
    }
    update();
  }

  @override
  void onInit() {
    getLikedProducts();
    super.onInit();
  }
}
