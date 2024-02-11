
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app/core/constant/BuildContextEntension.dart';
import 'package:store_app/core/constant/colors.dart';

class OnBoardingGenderButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isSelected;

  const OnBoardingGenderButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 150,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? ColorConstant.primary : context.myTheme.cardColor,
        ),
        child: Text(
          label,
          style: context.bodyLarge?.copyWith(
            color: isSelected ? Colors.white : const Color(0xff8F959E),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
