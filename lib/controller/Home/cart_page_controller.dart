import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class CartController extends GetxController {}

class CartPageControllerImpl extends CartController {
  Map<int, CartPageControllerImpl> itemControllers = {};
  RxInt counter = 1.obs;

  // CartPageControllerImpl() {
  //   counter = (itemControllers[0]!.counter ?? 1) as RxInt;
  // }

  final RxDouble subTotalPrice = 0.0.obs;
  final RxDouble shipingCost = 0.0.obs;
  RxDouble totalCost = 0.0.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  StatusRequest stateRequest = StatusRequest.none;

  CartPageControllerImpl getItemController(int index) {
    if (!itemControllers.containsKey(index)) {
      itemControllers[index] = CartPageControllerImpl();
    }
    return itemControllers[index]!;
  }

  void updatePrices(int amount) {
    calcSubTotalPrice(counter.value);
    calcShippingCost(counter.value);
    calcTotalCost();
  }

  double calcSubTotalPrice(int amount) {
    double total = 0.0;
    for (ProductModel element in products) {
      total += (element.itemPrice!);
    }

    subTotalPrice.value = total;

    return total * counter.value;
  }

  double calcShippingCost(int amount) {
    double total = 0.0;
    for (ProductModel element in products) {
      total += (element.itemPrice!) ~/ 15;
    }

    shipingCost.value = total;

    return total * counter.value;
  }

  double calcTotalCost() {
    return shipingCost.value + subTotalPrice.value;
  }

  addOne() {
    counter.value += 1;

    updatePrices(counter.value);
  }

  minusOne() {
    counter.value == 1 ? counter.value : counter.value -= 1;

    updatePrices(counter.value);
  }

  getOrderdProducts() async {
    products.value = await DBHelper.instance().getAllProducts("Cart_Products");

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
    getOrderdProducts();
    calcSubTotalPrice(counter.value);
    calcShippingCost(counter.value);
    calcTotalCost();
  }

  @override
  void onInit() {
    getOrderdProducts();
    super.onInit();
  }

  goToAddressPage() {
    Get.toNamed(AppRouts.addressPage);
  }

  goToPaymentpage() {
    Get.toNamed(AppRouts.paymentCardPage);
  }
}
