import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class SuccessRestPasswordController extends GetxController {
  goToLoginPage();
}

class SuccessRestPasswordControllerImpl extends SuccessRestPasswordController {
  @override
  goToLoginPage() {
    Get.toNamed(AppRouts.login);
  }
}
