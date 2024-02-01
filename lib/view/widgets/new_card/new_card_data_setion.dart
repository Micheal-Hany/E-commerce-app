import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/address_page/labled_text_form.dart';
import 'package:get/get.dart';

class NewCardDataSection extends StatelessWidget {
  const NewCardDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledTextField(
            hintText: "82".tr,
            label: "94".tr,
            controller: TextEditingController()),
        const SizedBox(height: 15),
        LabeledTextField(
            hintText: "5254 7634 8734 7690",
            label: "91".tr,
            controller: TextEditingController()),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabeledTextField(
                width: 180,
                hintText: "24/24",
                label: "92".tr,
                controller: TextEditingController()),
            LabeledTextField(
                width: 180,
                hintText: "7763",
                label: "CVV",
                controller: TextEditingController()),
          ],
        ),
        const SizedBox(
          height: 220,
        ),
        CustomButton(
            buttonName: "97".tr,
            onPressed: () {},
            backgroundColor: const Color(0xff9775FA),
            width: double.infinity - 20,
            height: 40)
      ],
    );
  }
}
