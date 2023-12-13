import 'package:flutter/material.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';

class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffF5F6FA),
        child: TextFormField(
          cursorHeight: 25,
          // cursorColor: Colors.black,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: "${'55'.tr}...",
            hintStyle: CustomStyle.textStyle15,
            prefixIcon: Image.asset(
              'assets/images/search_icon.png',
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffF5F6FA)),
              borderRadius: BorderRadius.circular(15),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffF5F6FA)),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffF5F6FA)),
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
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSearchFiled(),
        SizedBox(
          width: 5,
        ),
        CustomNotifacationButton(),
      ],
    );
  }
}

class CustomNotifacationButton extends StatelessWidget {
  const CustomNotifacationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color(0xff9775FA),
          borderRadius: BorderRadius.all(Radius.circular(100))),
      child: IconButton(
        icon: Image.asset(
          'assets/images/notification.png',
          color: Colors.white,
          height: 28,
          width: 28,
        ),
        onPressed: () {},
      ),
    );
  }
}
