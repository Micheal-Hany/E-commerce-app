import 'package:flutter/material.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/data/model/address_model.dart';
import 'package:get/get.dart';

class UserDeliveryAddress extends StatelessWidget {
  const UserDeliveryAddress({
    Key? key,
    required this.address,
    required this.isSelected,
  }) : super(key: key);

  final AddressModel address;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAvailableAddressesController());
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset("assets/images/location.jpeg"),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dimensions.getHeight(context) * .01),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: Dimensions.getWidth(context) * .6,
                  ),
                  child: Text(
                    "${address.country} (${address.locality})",
                    style: context.bodySmall!.copyWith(fontSize: 15),
                  ),
                ),
                SizedBox(height: Dimensions.getHeight(context) * .01),
                Text(
                  address.street,
                  style: context.bodySmall!.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
          !isSelected
              ? GetBuilder<ViewAvailableAddressesController>(
                  builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        controller.removeAddress(address);
                        controller.getAllAddresses();
                      },
                      child: Container(
                        width: 35.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xffDEDEDE),
                            width: 1.0,
                          ),
                        ),
                        child: Image.asset('assets/images/baskect.png'),
                      ),
                    );
                  },
                )
              : const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.green,
                )
        ],
      ),
    );
  }
}
