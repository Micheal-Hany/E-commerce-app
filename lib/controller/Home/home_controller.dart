import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/data/data%20source/remote/homedata.dart';
import 'package:store_app/data/model/product_model.dart';

abstract class HomeController extends GetxController {
  getData();
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();
  String? name;
  String? id;
  StatusRequest stateRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  List<ProductModel> products = [];
  // List data = [];
  List categories = [];
  @override
  void onInit() {
    getData();
    name = myServices.sharedPreferences.getString('username');
    id = myServices.sharedPreferences.getString('id');
    super.onInit();
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
        categories.addAll(response["categories"]);
        print('====================================================');
        print(productModels);
        print('====================================================');
      } else {
        stateRequest = StatusRequest.failure;
      }
    }

    update();
  }
}
