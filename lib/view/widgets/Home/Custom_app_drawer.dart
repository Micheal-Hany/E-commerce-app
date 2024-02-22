import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/drawer/drawer-data_listview.dart';
import 'package:store_app/view/widgets/drawer/drawer_User_info.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({
    super.key,
    required this.scaffoldKey,
  });
  final GlobalKey<ScaffoldState> scaffoldKey;
  @override
  Widget build(BuildContext context) {
    Get.find<HaomeScreenContollerImpl>();

    return GetBuilder<HaomeScreenContollerImpl>(
      builder: (controller) {
        controller.onInit();
        return Container(
          color: context.myTheme.scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    CustomCartIcon(
                        widget: const Icon(Icons.close_rounded),
                        onPressed: () =>
                            scaffoldKey.currentState!.closeDrawer(),
                        backgroundColor: context.myTheme.cardColor),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomDrawerUserInfo(),
                const SizedBox(
                  height: 30,
                ),
                CsutomDrawerDatalistView(
                  controller: controller,
                ),
                const SizedBox(
                  height: 150,
                ),
                GestureDetector(
                  onTap: () => controller.logOut(),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.logout_outlined,
                        color: Colors.red,
                      ),
                      // Image.asset("assets/images/Logout.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "108".tr,
                        style: CustomStyle.textStyle15.copyWith(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xffFF5757)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
