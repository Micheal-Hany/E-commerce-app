import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/view/screens/Home/cart_page.dart';
import 'package:store_app/view/screens/Home/favorite_page.dart';
import 'package:store_app/view/screens/Home/wallet_page.dart';
import 'package:store_app/view/widgets/Home/Custom_Home_Page.dart';

abstract class HaomeScreenContoller extends GetxController {
  changePage(int pageNum);
}

class HaomeScreenContollerImpl extends HaomeScreenContoller {
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
  List<String> screensName = ["Home", "Wishlist", "Cart", "Wallet"];
  @override
  changePage(int pageNum) {
    currentPage = pageNum;
    update();
  }
}
