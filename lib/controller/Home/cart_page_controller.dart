import 'package:get/get.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/custom_snackbar.dart';
import 'package:store_app/core/function/show_dialog.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/order_model.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class CartController extends GetxController {}

class CartPageControllerImpl extends CartController {
  CartPageControllerImpl() {
    initializeData();
  }

  void initializeData() {
    id = myServices.sharedPreferences.get("id").toString();
    address = myServices.sharedPreferences.get("address").toString();
    getOrderdProducts();
    getDeliverAddress();
    getCardNumber();
    if (productsPrices.isEmpty) {
      productsPrices.addAll(products);
    }
    updatePrices();
  }

  Map<int, CartPageControllerImpl> itemControllers = {};
  final homeScreenController = Get.find<HaomeScreenContollerImpl>();
  RxInt counter = 1.obs;
  MyServices myServices = Get.find();

  final RxDouble subTotalPrice = 0.0.obs;
  final RxDouble shipingCost = 0.0.obs;
  RxDouble totalCost = 0.0.obs;
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxList<ProductModel> productsPrices = <ProductModel>[].obs;

  StatusRequest stateRequest = StatusRequest.none;
  String country = "";
  String city = "";
  String cardNumber = "";
  String id = "";
  String address = "";

  makeOrder(OrderModel order) async {
    await DBHelper.instance().insertOrder(order);
    update();
  }

  addOrder() async {
    products.isNotEmpty
        ? {
            myServices.sharedPreferences.get("country").toString() != "null"
                ? {
                    myServices.sharedPreferences
                                .get("card_number")
                                .toString() !=
                            "null"
                        ? {
                            makeOrder(OrderModel(
                                cartNumber: cardNumber,
                                address: address,
                                deliveryPrice: shipingCost.value,
                                totalPrice: totalCost.value,
                                orderDateTime: DateTime.now(),
                                items: products)),
                            Get.toNamed(AppRouts.orderConfirmedScreen),
                            await DBHelper.instance()
                                .deleteAllRows("Cart_Products"),
                            customSnackbar("129".tr, ""),
                            getOrderdProducts(),
                            productsPrices.clear(),
                          }
                        : customDialog("130".tr, "131".tr, () {
                            Get.back(result: true);
                            Get.toNamed(AppRouts.viewAvailableCards);
                          }, () {
                            Get.back(result: false);
                          }, "132".tr, "133".tr),
                  }
                : customDialog("130".tr, "134".tr, () {
                    Get.back(result: true);
                    Get.toNamed(AppRouts.viewAvalibleAddresses);
                  }, () {
                    Get.back(result: false);
                  }, "135".tr, "133".tr),
          }
        : customDialog("130".tr, "136".tr, () {
            Get.back(result: true);
            homeScreenController.changePage(0);
          }, () {
            Get.back(result: false);
          }, "137".tr, "133".tr);
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
        : "Add country";
    var cityFromSharedPreferences = myServices.sharedPreferences.get("city");

    city = cityFromSharedPreferences != null
        ? cityFromSharedPreferences.toString()
        : "Add city";
    update();
  }

  getCardNumber() {
    var cardNumberFromSharedPreferences =
        myServices.sharedPreferences.get("card_number");

    cardNumber = cardNumberFromSharedPreferences != null
        ? cardNumberFromSharedPreferences.toString()
        : "";
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

  void addOne(ProductModel product) {
    productsPrices.add(product);
    update();
  }

  void minusOne(ProductModel product) {
    productsPrices.remove(product);
    update();
  }

  void calcSubTotalPrice() {
    subTotalPrice.value = 0.0;
    subTotalPrice.value = productsPrices.fold(
        0.0, (total, current) => total + current.itemPrice!);
    update();
  }

  void calcShippingCost() {
    shipingCost.value = 0.0;
    shipingCost.value = productsPrices.fold(
        0.0, (total, current) => total + (current.itemPrice! ~/ 5));

    update();
  }

  void calcTotalCost() {
    totalCost.value = 0.0;
    totalCost.value = subTotalPrice.value + shipingCost.value;
    update();
  }
}
