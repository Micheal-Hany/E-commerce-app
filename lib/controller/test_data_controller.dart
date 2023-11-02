import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/function/handlData.dart';

import 'package:store_app/data/data%20source/remote/test_data.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest stateRequest;
  getData() async {
    stateRequest = StatusRequest.loading;
    var response = await testData.getData();

    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response["status"] == "success") {
        data.addAll(response["data"]);
      } else {
        stateRequest = StatusRequest.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
