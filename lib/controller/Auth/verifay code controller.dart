import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class VerifayPasswordController extends GetxController {
  checkCode();
  goToRestPassword();
}

class VerifayPasswordControllerImpl extends VerifayPasswordController {
  late String verifayCode;

  @override
  checkCode() {}

  @override
  goToRestPassword() {
    Get.toNamed(AppRouts.resetPass);
  }
}
