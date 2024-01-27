
import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Add_review/Custom_text_form_filed.dart';

class LabeledTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final double? width;

  const LabeledTextField({
    Key? key,
    required this.hintText,
    required this.label,
    required this.controller,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:
              CustomStyle.textStyle17.copyWith(color: const Color(0xff1D1E20)),
        ),
        const SizedBox(height: 8.0),
        CustomTextField(
          isMultiline: false,
          keyboardType: TextInputType.text,
          onChanged: (text) {},
          controller: controller,
          width: width,
          height: 50.0,
          hintText: hintText,
        ),
      ],
    );
  }
}
