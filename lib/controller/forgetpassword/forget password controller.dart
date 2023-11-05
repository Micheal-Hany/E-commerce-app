import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/data/data%20source/remote/forgetpassword/checkemail.dart';

abstract class ForgeTPasswordController extends GetxController {
  checkEmail();
  goToVerifayCode();
}

class ForgeTPasswordControllerimpl extends ForgeTPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  CheckEmail checkEmailData = CheckEmail(Get.find());
  StatusRequest stateRequest = StatusRequest.none;
  @override
  checkEmail() async {
    if (formState.currentState!.validate()) {
      var formData = formState.currentState;
      if (formData!.validate()) {
        stateRequest = StatusRequest.loading;
        update();
        var response = await checkEmailData.checkEmail(email.text);
        stateRequest = handleData(response);
        if (StatusRequest.success == stateRequest) {
          if (response["status"] == "success") {
            Get.toNamed(AppRouts.verifayCode, arguments: {"email": email.text});
          } else {
            Get.defaultDialog(title: "Error", middleText: "Email Not Found");
            stateRequest = StatusRequest.failure;
          }
        }
        update();
      }
    }
  }

  @override
  goToVerifayCode() {}
}
