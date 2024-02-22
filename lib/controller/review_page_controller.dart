import 'package:get/get.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/function/show_dialog.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
 
import 'package:store_app/data/model/review_model.dart';

abstract class ReviewPageController extends GetxController {
  goBackToProductPage();
  goToAddNotePage();
}

class ReviewPageControllerImpl extends ReviewPageController {
  // ReviewPageControllerImpl() {
  //   reviews = Get.arguments;
  //   itemId = Get.parameters['id']!;
  // }
  List<ReviewModel> reviews = [];
  String itemId = '';
  final OrderTrackController orderTrackController =
      Get.find<OrderTrackController>();
  @override
  goBackToProductPage() {
    Get.back();
  }

  List<ReviewModel> getReviews() {
    return Get.arguments();
  }

  @override
  void goToAddNotePage() async {
    // Print the ID passed via GetX parameters
    print("Get.parameters ${Get.parameters['id']}");

    // Call getOrderContainingItem and await its result
    final itemExists =
        await DBHelper.instance().getOrderContainingItem(Get.parameters['id']!);

    // Check if the item exists
    if (itemExists != null) {
      Get.toNamed(AppRouts.addReviewPage);
    } else {
      customDialog("title", "content", () {}, () {}, "okLabel", "cancelLabel");
      print("No item found with the provided ID.");
    }
  }

  // Future<bool> doesItemExist(String itemId) async {
  //   for (var order in orderTrackController.orders) {
  //     for (var item in order.items) {
  //       print("Checking item with ID: ${item.itemId}");
  //       if (item.itemId == itemId) {
  //         return true; // Item found, return true
  //       }
  //     }
  //   }
  //   return false; // Item not found after checking all items
  // }

  // getItemId() async {
  //   OrderModel? order =
  //       await DBHelper.instance().getOrderContainingItem(itemId);
  //   if (order != null) {
  //     Get.toNamed(AppRouts.addReviewPage);
  //   } else {
  //     customDialog("title", "content", () {}, () {}, "okLabel", "cancelLabel");
  //   }
  // }
}
