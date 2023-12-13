import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/data/data%20source/remote/homedata.dart';
import 'package:store_app/data/model/categoriesmodel.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class HomeController extends GetxController {
  getCategoryData();
  getItemsData(String id);
  goToProductDetailes(ProductModel product);
  favProduct();
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

  bool isFavoraite = false;
  late RxInt selectedCategoryId = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 7, vsync: this);
    tabController.addListener(_handleTabSelection);
    name = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');

    getCategoryData();

    super.onInit();
  }

  void _handleTabSelection() {
    update();
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

  @override
  favProduct() {
    isFavoraite = !isFavoraite;
    update();
  }
}
