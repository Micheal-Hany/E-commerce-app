import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:store_app/core/constant/colors.dart';

class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.primaryColor,
        child: TextFormField(
          cursorHeight: 25,
          cursorColor: Colors.black,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: CustomStyle.textStyle15,
            prefixIcon: Image.asset(
              'assets/images/search_icon.png',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomSearchFiled(),
        IconButton(
          icon: Image.asset('assets/images/notification.png'),
          onPressed: () {},
        ),
      ],
    );
  }
}
