import 'package:flutter/material.dart';
import 'package:store_app/controller/add_review_controller.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/function/input_validtion.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:get/get.dart';

class NameAndExperienceInputSection extends StatelessWidget {
  const NameAndExperienceInputSection(
      {super.key, required this.controller, required this.formKey});
  final AddReviewControllerimple controller;
  final GlobalKey formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldAddReview(
            validator: (p0) => inputValidtion(p0!, 5, 30, "username"),
            controller: controller.name,
            labelText: "Name",
            hintText: '20'.tr),
        const SizedBox(
          height: 20,
        ),
        CustomTextFieldAddReview(
            validator: (p0) => inputValidtion(p0!, 5, 50, "text"),
            controller: controller.note,
            labelText: "Add your experince",
            hintText: '99'.tr),
        SizedBox(height: Dimensions.getHeight(context) * .02),
      ],
    );
  }
}

class CustomTextFieldAddReview extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  const CustomTextFieldAddReview({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorHeight: 23,
      cursorColor: Colors.black,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.bodySmall!.copyWith(fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.theme.cardColor),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.theme.cardColor),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.theme.cardColor),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
