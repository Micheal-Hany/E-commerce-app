import 'package:get/get.dart';
import 'package:store_app/Server_linkes.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/data/data%20source/remote/Auth/verifaycodeSignup.dart';

abstract class SignUpVerifayCodeController extends GetxController {
  checkCode();
  goToSuccessPage(String code);
}

class SignUpVerifayCodeControllerImpl extends SignUpVerifayCodeController {
  String? email;
  VerifayCodeSignUpData verifayCodeSignUpData =
      VerifayCodeSignUpData(Get.find());
  StatusRequest stateRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccessPage(String code) async {
    stateRequest = StatusRequest.loading;
    update();
    var response = await verifayCodeSignUpData.verifayCode(email!, code);
    print("------------------ $response-----------------");
    stateRequest = handleData(response);
    if (StatusRequest.success == stateRequest) {
      if (response["status"] == "success") {
        Get.toNamed(AppRouts.signUpSuccess);
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
}
