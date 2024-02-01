import 'package:flutter/material.dart';
import 'package:store_app/controller/Home/home_controller.dart';
import 'package:store_app/core/constant/Style.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

// class CustomSearchFiled extends StatelessWidget {
//   const CustomSearchFiled({Key? key, required this.controller})
//       : super(key: key);
//   @override
//   final HomeControllerImpl controller;
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Material(
//         borderRadius: BorderRadius.circular(15),
//         color: const Color(0xffF5F6FA),
//         child: TextFormField(
//           // controller: controller.searchController,
//           onChanged: (val) {
//             controller.searchController.text = val;
//             controller.checkSearch(val);
//           },
//           cursorHeight: 25,
//           // cursorColor: Colors.black,
//           maxLines: 1,
//           decoration: InputDecoration(
//             hintText: "${'55'.tr}...",
//             hintStyle: CustomStyle.textStyle15,
//             prefixIcon: IconButton(
//               onPressed: () => controller.searchItems(),
//               icon: Image.asset(
//                 'assets/images/search_icon.png',
//               ),
//             ),

//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Color(0xffF5F6FA)),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(color: Color(0xffF5F6FA)),
//               borderRadius: BorderRadius.circular(15),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(color: Color(0xffF5F6FA)),
//               borderRadius: BorderRadius.circular(15),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CustomNotifacationButton extends StatelessWidget {
  const CustomNotifacationButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff9775FA),
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: IconButton(
        icon: Image.asset(
          'assets/images/Voice.png',
          color: Colors.white,
          height: 30,
          width: 30,
        ),
        onPressed: () => !controller.speechEnabled
            ? controller.stopListening()
            : controller.startListening(),
      ),
    );
  }
}

class CustomSearchFiled extends StatelessWidget {
  const CustomSearchFiled({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeControllerImpl controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffF5F6FA),
        child: TextFormField(
          controller: controller.searchController,
          onChanged: (val) => controller.checkSearch(val),
          cursorHeight: 25,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: "${'55'.tr}...",
            hintStyle: CustomStyle.textStyle15,
            prefixIcon: IconButton(
              onPressed: () => controller.searchItems(),
              icon: Image.asset('assets/images/search_icon.png'),
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
  const CustomSearchBar({Key? key, required this.controller}) : super(key: key);
  final HomeControllerImpl controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSearchFiled(controller: controller),
        const SizedBox(
          width: 5,
        ),
        CustomNotifacationButton(controller: controller),
      ],
    );
  }
}

// class CustomNotifacationButton extends StatelessWidget {
//   const CustomNotifacationButton({
//     super.key,
//     required this.controller,
//   });
//   final HomeControllerImpl controller;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//           color: Color(0xff9775FA),
//           borderRadius: BorderRadius.all(Radius.circular(15))),
//       child: IconButton(
//         icon: Image.asset(
//           'assets/images/Voice.png',
//           color: Colors.white,
//           height: 30,
//           width: 30,
//         ),
//         onPressed: () => controller.startListening(),
//       ),
//     );
//   }
// }
