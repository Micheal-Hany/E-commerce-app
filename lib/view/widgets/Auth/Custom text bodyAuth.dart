import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  const CustomTextBodyAuth({super.key, required this.bodyText});
  final String bodyText;
  @override
  Widget build(BuildContext context) {
    return Text(
      bodyText,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1.3),
      textAlign: TextAlign.center,
    );
  }
}
