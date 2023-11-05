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
    var response = await verifayCode.verifay(email!, code);
    print("------------------ $response-----------------");
    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response["status"] == "success") {
        Get.toNamed(AppRouts.resetPass, arguments: {"email": "$email"});
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Veriacation code not correct");
        stateRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToRestPassword() {
    Get.toNamed(AppRouts.resetPass);
  }
}
