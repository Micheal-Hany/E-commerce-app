import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/controller/order_confermied_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';

import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:get/get.dart';

class OrderConfirmedScreen extends StatelessWidget {
  const OrderConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<OrderConferiedController>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: context.myTheme.appBarTheme.systemOverlayStyle!,
        child: GetBuilder<OrderConferiedController>(
          builder: (controller) {
            return Scaffold(
              // appBar: const CustomAppBar(),
              bottomNavigationBar: CustomButton(
                  buttonName: "164".tr,
                  onPressed: () => controller.goToshipping(),
                  backgroundColor: ColorConstant.primary,
                  width: double.infinity - 60,
                  height: 40),
              body: SafeArea(
                  child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/mask_group.png'),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: context.height * .02,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.width * .03,
                          ),
                          CustomCartIcon(
                              widget: const Icon(Icons.arrow_back_rounded),
                              onPressed: () => controller.goback(),
                              backgroundColor: context.myTheme.cardColor),
                        ],
                      ),
                      const Spacer(
                        flex: 3,
                      ),
                      Center(
                          child:
                              Image.asset('assets/images/order_confirmed.png')),
                      const SizedBox(height: 40.0),
                      Column(
                        children: [
                          Text(
                            '161'.tr,
                            style: context.headlineMedium,
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              '162'.tr,
                              style: const TextStyle(
                                  fontSize: 15, color: Color(0xff8F959E)),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(flex: 2),
                      CustomSignInButton(
                          widget: Text(
                            "163".tr,
                            style: context.bodyLarge,
                          ),
                          buttonName: "",
                          onPressed: () => controller.gotoOrderTrack(),
                          backgroundColor: context.myTheme.cardColor,
                          width: double.infinity - 20,
                          height: 60),
                      const Spacer(),
                    ],
                  ),
                ],
              )),
            );
          },
        ));
  }
}
