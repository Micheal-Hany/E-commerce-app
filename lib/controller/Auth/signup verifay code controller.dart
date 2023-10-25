import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class SignUpVerifayCodeController extends GetxController {
  checkCode();
  goToSuccessPage();
}

class SignUpVerifayCodeControllerImpl extends SignUpVerifayCodeController {
  late String verifayCode;

  @override
  checkCode() {}

  @override
  goToSuccessPage() {
    Get.toNamed(AppRouts.signUpSuccess);
  }
}
