import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key, required this.lableTitle, required this.iconData, required this.mrController});
  final String lableTitle;
  final IconData iconData;
  final TextEditingController? mrController;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mrController,
      cursorColor: AppColor.grey,
      decoration: InputDecoration(
        suffixIcon: Icon(iconData),
        suffixIconColor: AppColor.grey,
        labelStyle: const TextStyle(color: AppColor.grey),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(lableTitle)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
