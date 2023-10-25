import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToSuccessSigup();
}

class CheckEmailControllerImpl extends CheckEmailController {
  @override
  checkEmail() {}

  @override
  goToSuccessSigup() {
    Get.toNamed(AppRouts.signUpSuccess);
  }
}
