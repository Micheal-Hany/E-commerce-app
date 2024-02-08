import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/view/widgets/Add_review/Custom_text_form_filed.dart';

class LabeledTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final TextEditingController controller;
  final double? width;
  final String? Function(String?)? validator;
  const LabeledTextField(
      {Key? key,
      required this.hintText,
      required this.label,
      required this.controller,
      this.width,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.bodySmall!.copyWith(
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 8.0),
        CustomTextField(
        
          validator: validator,
          isMultiline: false,
          keyboardType: TextInputType.text,
          onChanged: (text) {},
          controller: controller,
          width: width,
          // height: 10.0,
          hintText: hintText,
        ),
      ],
    );
  }
}
