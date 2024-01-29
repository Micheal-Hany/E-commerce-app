import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';
import 'package:store_app/view/widgets/address_page/labled_text_form.dart';

class NewCardDataSection extends StatelessWidget {
  const NewCardDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LabeledTextField(
            hintText: "Mrh Raju",
            label: "Card Owner",
            controller: TextEditingController()),
        const SizedBox(height: 15),
        LabeledTextField(
            hintText: "5254 7634 8734 7690",
            label: "Card Number",
            controller: TextEditingController()),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabeledTextField(
                width: 180,
                hintText: "24/24",
                label: "EXP",
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
            buttonName: "Add Card",
            onPressed: () {},
            backgroundColor: const Color(0xff9775FA),
            width: double.infinity - 20,
            height: 40)
      ],
    );
  }
}
