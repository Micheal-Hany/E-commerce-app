import 'package:get/get.dart';
import 'package:store_app/core/constant/routsName.dart';

abstract class ReviewPageController extends GetxController {
  goBackToProductPage();
  goToAddNotePage();
}

class ReviewPageControllerImpl extends ReviewPageController {
  @override
  goBackToProductPage() {
    Get.back();
  }

  @override
  goToAddNotePage() {
    Get.toNamed(AppRouts.addReviewPage);
  }
}
