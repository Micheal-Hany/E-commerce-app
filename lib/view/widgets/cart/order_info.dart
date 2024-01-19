
import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

class OrderInfoSection extends StatelessWidget {
  const OrderInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Order Info",
              style:
                  CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w500),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: CustomStyle.textStyle15
                  .copyWith(color: const Color(0xff8F959E)),
            ),
            Text(
              "\$110",
              style: CustomStyle.textStyle15.copyWith(color: Colors.black),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping cost",
              style: CustomStyle.textStyle15
                  .copyWith(color: const Color(0xff8F959E)),
            ),
            Text(
              "\$10",
              style: CustomStyle.textStyle15.copyWith(color: Colors.black),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total",
              style: CustomStyle.textStyle15
                  .copyWith(color: const Color(0xff8F959E)),
            ),
            Text(
              "\$120",
              style: CustomStyle.textStyle15.copyWith(color: Colors.black),
            )
          ],
        ),
      ],
    );
  }
}
