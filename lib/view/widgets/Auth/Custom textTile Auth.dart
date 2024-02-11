import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';

class CustomTextAuthTitle extends StatelessWidget {
  const CustomTextAuthTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.headlineLarge,
      textAlign: TextAlign.center,
    );
  }
}
