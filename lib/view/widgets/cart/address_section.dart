import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/data/model/address_model.dart';
import 'package:store_app/view/widgets/cart/user_location.dart';

class CustomDeliveryAddress extends StatelessWidget {
  const CustomDeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Delivery Address",
              style:
                  CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w500),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
        CustomUserLocationDetailes(
          address: UserAddress(
              name: "Mrh Raju",
              country: "Bangladesh",
              city: "Sylhet",
              phoneNumber: "+880 1453-987533",
              address: "Chhatak, Sunamgonj 12/8AB"),
        )
      ],
    );
  }
}
