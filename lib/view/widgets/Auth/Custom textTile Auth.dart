import 'package:flutter/material.dart';

class CustomTextAuthTitle extends StatelessWidget {
  const CustomTextAuthTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 28),
      textAlign: TextAlign.center,
    );
  }
}

