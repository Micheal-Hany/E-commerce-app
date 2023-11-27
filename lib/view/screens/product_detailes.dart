import 'package:flutter/material.dart';
import 'package:store_app/core/function/responsive_app.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Home/Custom_setting_logo.dart';

class ProductDetailes extends StatelessWidget {
  const ProductDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
            child: Row(
              children: [
                CustomCartIcon(
                    backgroundColor: const Color(0xffF5F6FA),
                    onPressed: () {},
                    widget: Image.asset(
                      'assets/images/menu.png',
                    )),
                const Spacer(),
                CustomSettingLogo(
                  imageIcon: Image.asset(
                    'assets/images/bag.PNG',
                    width: Dimensions.getWidth(context) * .078,
                    height: Dimensions.getHeight(context) * .038,
                  ),
                  backgroundColor: const Color(0xffF5F6FA),
                  onPressed: () {},
                )
              ],
            ),
          ),
        )
      ],
    ));
  }
}
