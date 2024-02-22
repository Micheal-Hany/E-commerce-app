import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/controller/order_track_controller.dart';
import 'package:store_app/core/constant/routsName.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/view/screens/Home/cart_page.dart';
import 'package:store_app/view/screens/Home/favorite_page.dart';
import 'package:store_app/view/screens/Home/wallet_page.dart';
import 'package:store_app/view/widgets/Home/Custom_Home_Page.dart';

abstract class HaomeScreenContoller extends GetxController {
  changePage(int pageNum);
}

class HaomeScreenContollerImpl extends HaomeScreenContoller {
  WalletController walletController = Get.find<WalletController>();
  OrderTrackController orderTrackController= Get.find<OrderTrackController>();
  int currentPage = 0;
  List<Widget> screens = [
    const MyHomePage(),
    const FavoraitePage(),
    const CartPage(),
    const WalletPage()
  ];
  List<String> screenIcons = [
    'assets/images/home_icon.png',
    'assets/images/heart.png',
    'assets/images/bag_icon.png',
    'assets/images/wallet.png',
  ];

  getScreenname() {
    List<String> screensName = ["113".tr, "114".tr, "115".tr, "116".tr];
    return screensName;
  }

  @override
  changePage(int pageNum) {
    currentPage = pageNum;
    update();
  }

  final MyServices myServices = Get.find();
  logOut() {
    myServices.sharedPreferences.clear();
    Get.offNamed(AppRouts.login);
  }

  RxString name = "".obs;

  @override
  void onInit() {
    getScreenname();
    var usernameFromSharedPreferences =
        myServices.sharedPreferences.get("username");

    name.value = usernameFromSharedPreferences != null
        ? usernameFromSharedPreferences.toString()
        : "";

    super.onInit();
  }
}
