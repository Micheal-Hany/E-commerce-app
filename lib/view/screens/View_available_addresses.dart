import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/cart/user_location.dart';

class ViewAvailableAddresses extends StatelessWidget {
  const ViewAvailableAddresses({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAvailableAddressesController());

    return Scaffold(body: GetBuilder<ViewAvailableAddressesController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            const CustomViewAvailableAddressAppbar(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                height: Dimensions.getHeight(context) * .75,
                child: controller.addressList.isNotEmpty
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "120".tr,
                                style: context.bodySmall!.copyWith(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.addressList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: GestureDetector(
                                  onTap: () =>
                                      controller.setSelectedAddress(index),
                                  child: CustomUserDeliverAddress(
                                    address: controller.addressList[index],
                                    isSelected:
                                        controller.isAddressSelected(index),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                          "119".tr,
                          style: context.bodySmall!.copyWith(
                            fontSize: 17,
                          ),
                        ),
                      )),
            CustomButton(
                buttonName: "118".tr,
                onPressed: () => controller.goToMap(),
                backgroundColor: const Color(0xff9775FA),
                width: double.infinity - 20,
                height: 40),
          ]),
        );
      },
    ));
  }
}

class CustomViewAvailableAddressAppbar
    extends GetView<ViewAvailableAddressesController> {
  const CustomViewAvailableAddressAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCartIcon(
          backgroundColor: const Color(0xffFEFEFE),
          onPressed: () => controller.goBack(),
          widget: const Icon(Icons.arrow_back_rounded),
        ),
        const SizedBox(
          width: 50,
        ),
        Text(
          "117".tr,
          style: context.bodySmall!.copyWith(
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
