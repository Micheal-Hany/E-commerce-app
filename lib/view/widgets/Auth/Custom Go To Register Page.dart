import 'package:flutter/material.dart';

class CustomGoToRegisterPageOrLogin extends StatelessWidget {
  const CustomGoToRegisterPageOrLogin({super.key, required this.textOne, required this.textTwo, required this.onTap});
  final String textOne;
  final String textTwo;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textOne,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
        ),
        InkWell(
          onTap: onTap,
          child: Text(textTwo,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 14, color: Colors.black)),
        )
      ],
    );
  }
}
