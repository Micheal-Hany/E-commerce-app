import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class CartController extends GetxController {}

class CartPageControllerImpl extends CartController {
  final RxInt counter = 1.obs;
  List<ProductModel> products = [];
  StatusRequest stateRequest = StatusRequest.none;
  addOne() {
    counter.value += 1;
    update();
  }

  minusOne() {
    counter.value == 1 ? counter : counter.value -= 1;
    update();
  }

  getOrderdProducts() async {
    products = await DBHelper.instance().getAllProducts("Cart_Products");

    stateRequest = StatusRequest.loading;
    if (products.isEmpty) {
      stateRequest = StatusRequest.failure;
    } else {
      stateRequest = StatusRequest.success;
    }
    update();
  }

  remove(ProductModel product) async {
    await DBHelper.instance().deleteProduct("Cart_Products", product);
  }

  @override
  void onInit() {
    getOrderdProducts();
    super.onInit();
  }
}
