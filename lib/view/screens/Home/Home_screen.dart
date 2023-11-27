import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Home/Custom_bottom_navber_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HaomeScreenContollerImpl());
    return GetBuilder<HaomeScreenContollerImpl>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xffFEFEFE),
          bottomNavigationBar: Material(
            color: const Color(0xffFEFEFE),
            elevation: 0,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .06,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...List.generate(
                    controller.screens.length,
                    (index) => IconBottomAppBar(
                      onTap: () => controller.changePage(index),
                      widget: index != controller.currentPage
                          ? Image.asset(
                              controller.screenIcons[index],
                              width: 30,
                              height: 30,
                            )
                          : Text(
                              controller.screensName[index],
                              style: CustomStyle.textStyle15
                                  .copyWith(color: const Color(0xff9775FA)),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: controller.screens[controller.currentPage],
        );
      },
    );
  }
}
