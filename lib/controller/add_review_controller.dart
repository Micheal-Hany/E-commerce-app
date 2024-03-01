import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:store_app/core/function/custom_snackbar.dart';
import 'package:store_app/core/function/handlData.dart';
import 'package:store_app/data/data%20source/remote/review_data.dart';

abstract class AddReviewController extends GetxController {
  goBackToReviews();
}

class AddReviewControllerimple extends AddReviewController {
  final formkey = GlobalKey<FormState>();
  ReviewData reviewData = ReviewData(Get.find());
  StatusRequest stateReques = StatusRequest.none;
  final name = TextEditingController();
  final note = TextEditingController();

  double rate = 1;

  makeReview(String id, String rate) async {
    if (formkey.currentState!.validate()) {
      stateReques = StatusRequest.loading;
      var response =
          await reviewData.postReview(id, name.text, note.text, rate);

      stateReques = handleData(response);
      if (StatusRequest.success == stateReques) {
        if (response["status"] == "success") {
        } else {
          stateReques = StatusRequest.failure;
        }
      }
      customSnackbar(
        "127".tr,
        "",
      );
      note.clear();
      name.clear();
    }

    update();
  }

  @override
  goBackToReviews() {
    Get.back();
  }
}
