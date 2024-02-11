import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class CartController extends GetxController {}

class CartPageControllerImpl extends CartController {
  Map<int, CartPageControllerImpl> itemControllers = {};
  RxInt counter = 1.obs;
  MyServices myServices = Get.find();

  final RxDouble subTotalPrice = 0.0.obs;
  final RxDouble shipingCost = 0.0.obs;
  RxDouble totalCost = 0.0.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;

  StatusRequest stateRequest = StatusRequest.none;
  String country = "";
  String city = "";
  String cardNumber = "";

  CartPageControllerImpl getItemController(int index) {
    if (!itemControllers.containsKey(index)) {
      itemControllers[index] = CartPageControllerImpl();
    }
    return itemControllers[index]!;
  }

  void updatePrices() {
    calcSubTotalPrice();
    calcShippingCost();
    calcTotalCost();
    update();
  }

  getOrderdProducts() async {
    products.value = await DBHelper.instance().getAllProducts("Cart_Products");

    stateRequest = StatusRequest.loading;
    if (products.isEmpty) {
      stateRequest = StatusRequest.failure;
    } else {
      stateRequest = StatusRequest.success;
    }
    updatePrices();
    update();
  }

  remove(ProductModel product) async {
    await DBHelper.instance().deleteProduct("Cart_Products", product);
    getOrderdProducts();
    print("updating orderd products");
    update();
  }

  getDeliverAddress() {
    var countryFromSharedPreferences =
        myServices.sharedPreferences.get("country");

    country = countryFromSharedPreferences != null
        ? countryFromSharedPreferences.toString()
        : "110".tr;
    var cityFromSharedPreferences = myServices.sharedPreferences.get("city");

    city = cityFromSharedPreferences != null
        ? cityFromSharedPreferences.toString()
        : "";
    update();
  }

  getCardNumber() {
    var cardNumberFromSharedPreferences =
        myServices.sharedPreferences.get("card_number");

    cardNumber = cardNumberFromSharedPreferences != null
        ? cardNumberFromSharedPreferences.toString()
        : "111".tr;
    update();
  }

  @override
  void onInit() {
    getDeliverAddress();
    getCardNumber();
    getOrderdProducts();
    super.onInit();
  }

  goToAddressPage() {
    Get.toNamed(AppRouts.viewAvalibleAddresses);
  }

  goToViewAvalibleCard() {
    Get.toNamed(AppRouts.viewAvailableCards);
  }

  void addOne() {
    counter.value++;
    update();
  }

  void minusOne() {
    counter.value == 1 ? counter.value : counter.value--;
    update();
  }

  void calcShippingCost() {
    shipingCost.value = 0.0;
    for (ProductModel products in products) {
      shipingCost.value += (products.itemPrice! ~/ 5) * counter.value;
    }
    print(" shipingCost ${shipingCost.value}");
    update();
  }

  void calcSubTotalPrice() {
    subTotalPrice.value = 0.0;
    for (ProductModel products in products) {
      subTotalPrice.value += products.itemPrice! * counter.value;
    }
    print("subTotalPrice${subTotalPrice.value}");
    update();
  }

  void calcTotalCost() {
    totalCost.value = 0.0;
    totalCost.value = subTotalPrice.value + shipingCost.value;
    print(totalCost.value);
    update();
  }
}
