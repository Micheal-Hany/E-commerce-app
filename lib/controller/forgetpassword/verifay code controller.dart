import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/data/data%20source/remote/forgetpassword/verifaycode.dart';

abstract class VerifayCodeController extends GetxController {
  checkCode(String code);
  goToRestPassword();
}

class VerifayCodeControllerImpl extends VerifayCodeController {
  String? email;
  VerifayCode verifayCode = VerifayCode(Get.find());
  StatusRequest stateRequest = StatusRequest.none;

  @override
  checkCode(String code) async {
    stateRequest = StatusRequest.loading;
    update();
    onInit();
    var response = await verifayCode.verifay(email!, code);
    print("------------------ $response-----------------");
    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response["status"] == "success") {
        Get.toNamed(AppRouts.resetPass, arguments: {"email": "$email"});
        email = '';
      } else {
        Get.defaultDialog(title: "48".tr, middleText: "50".tr);
        stateRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // @override
  // void onInit() {
  //   email = Get.arguments['email'];
  //   super.onInit();
  // }
  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments.containsKey('email')) {
      email = Get.arguments['email'];
    } else {
      email = null;
      print("Email not found in arguments or arguments is null");
    }

    super.onInit();
  }

  @override
  goToRestPassword() {
    Get.toNamed(AppRouts.resetPass);
  }
}
