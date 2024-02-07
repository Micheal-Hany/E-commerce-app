import 'package:flutter/material.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/data/model/address_model.dart';
import 'package:store_app/view/screens/Map_page.dart';
import 'package:get/get.dart';

class CustomUserLocationDetailes extends StatelessWidget {
  const CustomUserLocationDetailes({
    Key? key,
    required this.country,
    required this.city,
  }) : super(key: key);

  final String country;
  final String city;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset("assets/images/location.jpeg")),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: Dimensions.getWidth(context) * .6,
                  ),
                  child: Text(
                    country ?? "Add One",
                    style: CustomStyle.textStyle15.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
                Text(
                  city,
                  style: CustomStyle.textStyle11.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.check_circle_rounded,
            color: Color(0xff4AC76D),
          ),
        ],
      ),
    );
  }
}

class CustomUserDeliverAddress extends StatelessWidget {
  const CustomUserDeliverAddress(
      {Key? key, required this.address, required this.isSelected})
      : super(key: key);

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
                child: Image.asset("assets/images/location.jpeg")),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: Dimensions.getWidth(context) * .6,
                  ),
                  child: Text(
                    "${address.country} (${address.locality})",
                    style: CustomStyle.textStyle15.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.getHeight(context) * .01,
                ),
                Text(
                  address.street,
                  style: CustomStyle.textStyle11.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
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
                          child: Image.asset(
                            'assets/images/baskect.png',
                          )),
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
