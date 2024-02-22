import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class CustomHomeAppBar extends GetView<HaomeScreenContollerImpl> {
  const CustomHomeAppBar({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final CartPageControllerImpl cartController =
        Get.find<CartPageControllerImpl>();

    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: context.myTheme.cardColor,
         
          onPressed: () => scaffoldKey.currentState!.openDrawer(),
          widget: const Icon(Icons.menu_open_rounded),
        ),
        const Spacer(),
        Stack(
          children: [
            CustomCartIcon(
              widget: const Icon(Icons.shopping_cart_checkout_rounded),
              backgroundColor: context.myTheme.cardColor,
              onPressed: () => controller.changePage(2),
            ),
            Container(
                width: 17,
                height: 17,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(100)),
                child: Obx(
                  () => Center(
                      child: Text(
                    "${cartController.products.length}",
                    style:
                        CustomStyle.textStyle13.copyWith(color: Colors.white),
                  )),
                ))
          ],
        )
      ],
    );
  }
}
