import 'package:get/get.dart';

abstract class AddReviewController extends GetxController {
  goBackToReviews();
}

class AddReviewControllerimple extends AddReviewController {
  @override
  goBackToReviews() {
    Get.back();
  }
}
