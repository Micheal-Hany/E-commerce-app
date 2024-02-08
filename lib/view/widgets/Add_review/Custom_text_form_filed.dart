import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isMultiline;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final width;
  final height;
  final lable;
  final String? Function(String?)? validator;
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.keyboardType = TextInputType.text,
      this.isMultiline = false,
      this.onChanged,
      required this.controller,
      this.width,
      this.height,
      this.lable,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: context.myTheme.cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 60,
        child: TextFormField(
          validator: validator,
          cursorHeight: 23,
          cursorColor: Colors.black,
          maxLines: isMultiline ? null : 1,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            //label: Text(lable),
            hintText: hintText,
            hintStyle: context.bodySmall!.copyWith(fontSize: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.myTheme.cardColor),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: context.myTheme.cardColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: context.myTheme.cardColor),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
