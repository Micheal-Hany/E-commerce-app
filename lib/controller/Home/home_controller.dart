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
  getData();
  goToProductDetailes();
  goToReviewPage();
}

// class HomeControllerImpl extends HomeController {
//   MyServices myServices = Get.find();
//   String? name;
//   String? id;
//   StatusRequest stateRequest = StatusRequest.none;
//   HomeData homeData = HomeData(Get.find());
//   List<ProductModel> products = [];
//   List categories = [];
//   @override
//   void onInit() {
//     getData();
//     name = myServices.sharedPreferences.getString('username');
//     id = myServices.sharedPreferences.getString('id');
//     super.onInit();
//   }

//   @override
//   Future<void> getData() async {
//     stateRequest = StatusRequest.loading;
//     var response = await homeData.getData();

//     stateRequest = handleData(response);
//     if (StatusRequest.success == stateRequest) {
//       if (response["status"] == "success") {
//         List<ProductModel> productModels = (response["items"] as List<dynamic>)
//             .map((item) => ProductModel.fromJson(item))
//             .toList();

//         products.addAll(productModels);
//         categories.addAll(response["categories"]);
//       } else {
//         stateRequest = StatusRequest.failure;
//       }
//     }

//     update();
//   }
// }

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
  var selectedProduct = ProductModel();

  void setProduct(ProductModel product) {
    selectedProduct = product;
  }

  @override
  void onInit() {
    getData();
    name = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');

    // Initialize tabController
    tabController = TabController(length: 8, vsync: this);
    tabController.addListener(_handleTabSelection);

    super.onInit();
  }

  void _handleTabSelection() {
    update(); // Trigger a rebuild when a tab is selected
  }

  @override
  Future<void> getData() async {
    stateRequest = StatusRequest.loading;
    var response = await homeData.getData();

    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response["status"] == "success") {
        List<ProductModel> productModels = (response["items"] as List<dynamic>)
            .map((item) => ProductModel.fromJson(item))
            .toList();

        products.addAll(productModels);
        List<CategoriesModel> categorory =
            (response["categories"] as List<dynamic>)
                .map((item) => CategoriesModel.fromJson(item))
                .toList();
        categories.addAll(categorory);
        print('================================================)');
        print(categories.first.categoriesNameEn);
        print('================================================)');
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

  backToHomePage() {
    Get.back();
  }

  @override
  goToProductDetailes() {
    Get.toNamed(AppRouts.productPage);
  }

  @override
  goToReviewPage() {
    Get.toNamed(AppRouts.reviewPage);
  }
}
