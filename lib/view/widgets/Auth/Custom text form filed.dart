import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.lableTitle,
    required this.iconData,
    required this.mrController,
    required this.validator,
    this.isNumber = false,
    this.obscureText,
    this.onTap,
  });
  final void Function()? onTap;
  final String lableTitle;
  final IconData iconData;
  final TextEditingController? mrController;
  final String? Function(String?)? validator;
  final bool isNumber;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: isNumber ? TextInputType.number : TextInputType.name,
      validator: validator,
      controller: mrController,
      obscureText: obscureText == null || obscureText == false ? false : true,
      cursorColor: AppColor.primaryColorDart,
      decoration: InputDecoration(
        suffixIcon: InkWell(onTap: onTap, child: Icon(iconData)),
        suffixIconColor: AppColor.primaryColorDart,
        labelStyle: const TextStyle(color: AppColor.primaryColorDart),
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
