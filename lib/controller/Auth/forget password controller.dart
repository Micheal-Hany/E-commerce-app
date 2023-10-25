import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class ForgeTPasswordController extends GetxController {
  checkEmail();
  goToVerifayCode();
}

class ForgeTPasswordControllerimpl extends ForgeTPasswordController {
  
  @override
  checkEmail() {}
  @override
  void onInit() {
    

    super.onInit();
  }

  @override
  void dispose() {
   

    super.dispose();
  }

  @override
  goToVerifayCode() {
    Get.toNamed(AppRouts.verifayCode);
  }
}
