import 'package:get/get.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
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

  void updatePrices(int amount) {
    calcSubTotalPrice(amount);
    calcShippingCost(amount);
    calcTotalCost();
    update();
  }

  void calcSubTotalPrice(int amount) {
    // Assuming each product has a price attribute
    double subtotal = 0.0;
    for (ProductModel product in products) {
      subtotal += product.itemPrice! * amount; // Multiply by the amount
    }
    subTotalPrice.value = subtotal;
    update();
  }

  // Function to calculate shipping cost based on the amount
  void calcShippingCost(int amount) {
    double shippingCost = 0.0;

    shippingCost = amount * 5.0;
    shipingCost.value = shippingCost;
    update();
  }

  // Function to calculate total cost based on subtotal and shipping cost
  void calcTotalCost() {
    totalCost.value = subTotalPrice.value + shipingCost.value;
    update();
  }

  addOne() {
    updatePrices(counter.value);
    return counter.value += 1;
  }

  minusOne() {
    updatePrices(counter.value);
    return counter.value == 1 ? counter.value : counter.value -= 1;
  }

  getOrderdProducts() async {
    products.value = await DBHelper.instance().getAllProducts("Cart_Products");
    print(products);
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
    // updatePrices(counter.value);
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
    updatePrices(counter.value);
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
}
