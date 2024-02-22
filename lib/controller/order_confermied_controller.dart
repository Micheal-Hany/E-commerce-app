import 'package:get/get.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/core/constant/routsName.dart';

class OrderConferiedController extends GetxController {
  CartPageControllerImpl cartPageControllerImpl =
      Get.find<CartPageControllerImpl>();
  OrderTrackController orderTrackController = Get.find<OrderTrackController>();

  HaomeScreenContollerImpl homeScreenController =
      Get.find<HaomeScreenContollerImpl>();
  goback() {
    Get.back();
    cartPageControllerImpl.getOrderdProducts();
  }

  gotoOrderTrack() {
    Get.toNamed(AppRouts.orderTrackPage);
    orderTrackController.getOrders();
  }

  goToshipping() {
    Get.back();
    homeScreenController.changePage(0);
  }
}
