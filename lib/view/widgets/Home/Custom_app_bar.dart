import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/cart_page_controller.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Home/Custom_setting_logo.dart';
import 'package:get/get.dart';

class CustomAppBar extends GetView<HaomeScreenContollerImpl> {
  const CustomAppBar({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    final CartPageControllerImpl cartController =
        Get.put(CartPageControllerImpl());

    return Row(
      children: [
        CustomCartIcon(
            backgroundColor: const Color(0xffF5F6FA),
            onPressed: () => scaffoldKey.currentState!.openDrawer(),
            widget: Image.asset(
              'assets/images/menu.png',
            )),
        const Spacer(),
        Stack(
          children: [
            CustomSettingLogo(
              imageIcon: Image.asset(
                'assets/images/bag.PNG',
                width: Dimensions.getWidth(context) * .078,
                height: Dimensions.getHeight(context) * .038,
              ),
              backgroundColor: const Color(0xffF5F6FA),
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
