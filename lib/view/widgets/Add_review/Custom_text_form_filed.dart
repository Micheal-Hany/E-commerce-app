import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isMultiline;
  final Function(String)? onChanged;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isMultiline = false,
    this.onChanged,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF5F6FA),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        cursorHeight: 25,
        cursorColor: Colors.black,
        maxLines: isMultiline ? null : 1,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
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
    );
  }
}
