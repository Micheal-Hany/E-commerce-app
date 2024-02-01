
import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';

class CustomButtonAddNewcard extends StatelessWidget {
  const CustomButtonAddNewcard({
    Key? key,
    required this.buttonName,
    required this.onPressed,
    required this.backgroundColor,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String buttonName;
  final void Function()? onPressed;
  final Color backgroundColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(color: Colors.deepPurpleAccent),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          buttonName,
          style:
              CustomStyle.textStyle17.copyWith(color: const Color(0xff9775FA)),
        ),
      ),
    );
  }
}
