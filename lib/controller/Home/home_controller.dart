import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/data%20source/remote/homedata.dart';
import 'package:store_app/data/model/categoriesmodel.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class HomeController extends GetxController {
  getCategoryData();
  getItemsData(String id);
  goToProductDetailes(ProductModel product);
  favProduct(ProductModel product);
}

class HomeControllerImpl extends HomeController
    with GetSingleTickerProviderStateMixin {
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

  @override
  void onInit() {
    tabController = TabController(length: 7, vsync: this);
    tabController.addListener(() => update());
    name = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');

    getCategoryData();

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
        print(products.first.categoriesNameEn);
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

  @override
  goToProductDetailes(ProductModel product) {
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
}
