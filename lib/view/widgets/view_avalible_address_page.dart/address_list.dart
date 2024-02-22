import 'package:flutter/material.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/cart/UserDeliveryAddress.dart';
import 'package:get/get.dart';

class AddressList extends StatelessWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ViewAvailableAddressesController>();

    return SizedBox(
        height: Dimensions.getHeight(context) * .75,
        child: GetBuilder<ViewAvailableAddressesController>(
          builder: (controller) {
            return controller.addressList.isNotEmpty
                ? Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "120".tr,
                            style: context.bodySmall!.copyWith(fontSize: 17),
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
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: GestureDetector(
                              onTap: () => controller.setSelectedAddress(index),
                              child: UserDeliveryAddress(
                                address: controller.addressList[index],
                                isSelected: controller.isAddressSelected(index),
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
                      style: context.bodySmall!.copyWith(fontSize: 17),
                    ),
                  );
          },
        ));
  }
}
