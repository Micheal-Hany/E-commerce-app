import 'package:flutter/material.dart';

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
        color: const Color(0xffF5F6FA),
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
            hintStyle: const TextStyle(fontSize: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffFEFEFE)),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffFEFEFE)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffFEFEFE)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
