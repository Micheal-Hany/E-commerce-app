import 'package:flutter/material.dart';

class IconBottomAppBar extends StatelessWidget {
  final Widget widget;

  final Function() onTap;

  const IconBottomAppBar({
    super.key,
    required this.widget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: IconButton(
          padding: const EdgeInsets.all(0), onPressed: onTap, icon: widget),
    );
  }
}


// Text(
//             "[index]",
//             style: CustomStyle.textStyle11
//                 .copyWith(color: const Color(0xff3D93F8)),
//           )