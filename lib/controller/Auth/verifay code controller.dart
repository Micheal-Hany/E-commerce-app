import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class VerifayCodeController extends GetxController {
  checkCode();
  goToRestPassword();
}

class VerifayCodeControllerImpl extends VerifayCodeController {
  late String verifayCode;

  @override
  checkCode() {}

  @override
  goToRestPassword() {
    Get.toNamed(AppRouts.resetPass);
  }
}
