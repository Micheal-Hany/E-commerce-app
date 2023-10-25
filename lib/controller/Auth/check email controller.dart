import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class CheckEmailController extends GetxController {
  checkEmail();
  goToVerifayCode();
}

class CheckEmailControllerImpl extends CheckEmailController {
  @override
  checkEmail() {}

  @override
  goToVerifayCode() {
    Get.toNamed(AppRouts.signUpVerifayCode);
  }
}
