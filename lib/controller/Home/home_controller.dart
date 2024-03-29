import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:store_app/controller/product-detailes_controller.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/data%20source/remote/homedata.dart';
import 'package:store_app/data/model/categoriesmodel.dart';
import 'package:store_app/data/model/product_model.dart';
import 'package:speech_to_text/speech_to_text.dart';

abstract class HomeController extends GetxController {
  getCategoryData();
  getItemsData(String id);
  goToProductDetailes(ProductModel product);
  favProduct(ProductModel product);
}

class HomeControllerImpl extends HomeController
    with GetSingleTickerProviderStateMixin {
  List<ProductModel> searchProducts = [];

  final SpeechToText _speechToText = SpeechToText();
  final RxBool _speechEnabled = false.obs;
  final RxString _lastWords = ''.obs;
  MyServices myServices = Get.find();
  String? name;
  String? id;
  StatusRequest stateRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  List<ProductModel> products = [];
  List<CategoriesModel> categories = [];
  late TabController tabController;
  RxSet<int> favoritedProductIds = <int>{}.obs;
  late RxInt selectedCategoryId = 0.obs;
  final TextEditingController searchController = TextEditingController();
  bool isLising = false;
  bool get speechEnabled => _speechEnabled.value;
  set speechEnabled(bool value) => _speechEnabled.value = value;

  String get lastWords => _lastWords.value;
  @override
  void onInit() {
    tabController = TabController(length: 7, vsync: this);
    tabController.addListener(() => update());
    name = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');

    getCategoryData();
    _initSpeech();
    super.onInit();
  }

  @override
  Future<void> getCategoryData() async {
    stateRequest = StatusRequest.loading;
    var response = await homeData.getCategories();

    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response["status"] == "success") {
        List<CategoriesModel> categorory =
            (response["categories"] as List<dynamic>)
                .map((item) => CategoriesModel.fromJson(item))
                .toList();
        categories.addAll(categorory);
        selectedCategoryId.value =
            categories.isNotEmpty ? categories[0].categoriesId! : 0;
        getItemsData(selectedCategoryId.toString());
      } else {
        stateRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  getItemsData(String id) async {
    products.clear();
    stateRequest = StatusRequest.loading;
    var response = await homeData.getItems(id.toString());

    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response["status"] == "success") {
        List<ProductModel> productModels = (response["data"] as List<dynamic>)
            .map((item) => ProductModel.fromJson(item))
            .toList();

        products.addAll(productModels);
        // print(products.first.categoriesNameEn);
      } else {
        stateRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onClose() {
    tabController.dispose();

    super.onClose();
  }

  final ProductDetailesControllerImpl productDetailesControllerImpl =
      Get.find<ProductDetailesControllerImpl>();
  @override
  goToProductDetailes(ProductModel product) {
    productDetailesControllerImpl.getReviews(product.itemId.toString());

    Get.toNamed(AppRouts.productPage, arguments: product);
  }

  bool isProductFavoraite(ProductModel product) {
    return favoritedProductIds.contains(product.itemId);
  }

  @override
  favProduct(ProductModel product) {
    if (isProductFavoraite(product)) {
      favoritedProductIds.remove(product.itemId);
    } else {
      favoritedProductIds.add(product.itemId!);
    }
    update();
  }

  void addProductToDatabase(ProductModel product) async {
    ProductModel? existingProduct = await DBHelper.instance()
        .getProductById(product.itemId!, "Liked_Products");

    if (existingProduct != null) {
      print('already exists: ${product.itemId}');
    } else {
      int productId =
          await DBHelper.instance().insertProduct("Liked_Products", product);

      print('Product inserted with ID: $productId');
    }
  }

  remove(ProductModel product) async {
    await DBHelper.instance().deleteProduct("Liked_Products", product);
  }

  bool isSearch = false;

  checkSearch(val) {
    if (val == "") {
      // getCategoryData();
      isSearch = false;
    } else {
      searchItems();
      update();
    }
    update();
  }

  searchItems() async {
    searchProducts.clear();
    isSearch = true;
    stateRequest = StatusRequest.loading;
    var response = await homeData.search(searchController.text);
    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response["status"] == "success") {
        List responceData = response["data"];
        searchProducts
            .addAll(responceData.map((e) => ProductModel.fromJson(e)));
      } else {
        stateRequest = StatusRequest.failure;
      }
    }

    update();
  }

  // void _initSpeech() async {
  //   var result = await _speechToText.initialize();
  //   if (_speechToText.lastError != null) {
  //     print('Speech initialization error: ${_speechToText.lastError}');
  //   } else {
  //     _speechEnabled.value = true;
  //   }
  // }
  void _initSpeech() async {
    var status = await Permission.microphone.request();
    if (status.isGranted) {
      await _speechToText.initialize();
      if (_speechToText.lastError != null) {
        print('Speech initialization error: ${_speechToText.lastError}');
      } else {
        _speechEnabled.value = true;
      }
    } else {
      print('Microphone permission not granted');
    }
  }

  void startListening() async {
    isLising = true;
    await _speechToText.listen(onResult: _onSpeechResult);
    if (_speechToText.lastError != null) {
      print('Speech listening error: ${_speechToText.lastError}');
    }
    update();
  }

  void stopListening() async {
    if (_speechEnabled.value) {
      await _speechToText.stop();
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    _lastWords.value = result.recognizedWords;
    searchController.text = result.recognizedWords;
    print("result is ${result.recognizedWords}");
    isLising = false;
    update();
  }
}
