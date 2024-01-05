import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/favorite_page_controller.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';

class CustomFavoriteAppBar extends GetView<HaomeScreenContollerImpl> {
  const CustomFavoriteAppBar({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: const Color(0xffFEFEFE),
          onPressed: () => controller.changePage(0),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.getWidth(context) / 4.1),
          child: Text(
            '65'.tr,
            style:
                CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        CustomCartIcon(
          backgroundColor: const Color(0xffFEFEFE),
          onPressed: () {},
          widget: Image.asset('assets/images/bag.PNG'),
        ),
      ],
    );
  }
}
