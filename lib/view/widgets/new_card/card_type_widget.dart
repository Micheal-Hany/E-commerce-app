import 'package:flutter/material.dart';

class CustomCardType extends StatelessWidget {
  const CustomCardType({
    Key? key,
    required this.imageUrl,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  final String imageUrl;
  final Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xffFFEEE3) : const Color(0xffF5F6FA),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                isSelected ? const Color(0xffFF5F00) : const Color(0xffF5F6FA),
          ),
        ),
        child: Image.asset(imageUrl),
      ),
    );
  }
}
