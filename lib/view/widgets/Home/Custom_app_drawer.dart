import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/drawer_controller.dart';
import 'package:store_app/controller/address_page_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/address_page/swich_key.dart';
import 'package:get/get.dart';
import 'package:store_app/view/widgets/drawer/drawer-data_listview.dart';
import 'package:store_app/view/widgets/drawer/drawer_User_info.dart';

class CustomAppDrawer extends StatelessWidget {
  const CustomAppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(DrawerControllaller());
    return GetBuilder<DrawerControllaller>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomCartIcon(
                    widget: Image.asset("assets/images/menu (1).png"),
                    onPressed: () {},
                    backgroundColor: const Color(0xffF5F5F5)),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomDrawerUserInfo(),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset("assets/images/sun.png"),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Dark Mode",
                    style: CustomStyle.textStyle15.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff1D1E20)),
                  ),
                  const Spacer(),
                  SwitchExample(controller: AddressPageController())
                ],
              ),
              CsutomDrawerDatalistView(controllaller: controller),
              const SizedBox(
                height: 180,
              ),
              GestureDetector(
                onTap: () => controller.logOut(),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset("assets/images/Logout.png"),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Logout",
                      style: CustomStyle.textStyle15.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xffFF5757)),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
