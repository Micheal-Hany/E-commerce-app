import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLoginPage();
}

class SuccessSignUpControllerImpl extends SuccessSignUpController {
  @override
  goToLoginPage() {
    Get.offNamed(AppRouts.login);
  }
}
