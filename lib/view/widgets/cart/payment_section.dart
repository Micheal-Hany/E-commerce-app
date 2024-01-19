
import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/data/model/cart_model.dart';
import 'package:store_app/view/widgets/cart/pay_methos-details.dart';

class CustomPaymentMethod extends StatelessWidget {
  const CustomPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment Method",
              style:
                  CustomStyle.textStyle17.copyWith(fontWeight: FontWeight.w500),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
        CustomUserCartDetailes(
            cart: CartModel(
                cardNumber: "**** 7690",
                cardOwner: "cardOwner",
                expDate: "expDate",
                cvv: "cvv"))
      ],
    );
  }
}
