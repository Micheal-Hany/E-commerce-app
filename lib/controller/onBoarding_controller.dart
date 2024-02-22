
import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';


abstract class onbordingController extends GetxController {}

class onBordingControllerImplment extends onbordingController {
  var isMale = false.obs;

  void selectGender(bool male) {
    isMale.value = male;
  }

  goToSignInWith() {
    Get.toNamed(AppRouts.signInWithPage);
  }
}
