import 'package:flutter/material.dart';

class CustomGoToRegisterPage extends StatelessWidget {
  const CustomGoToRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Do not have an account? ',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 14),
        ),
        Text('Sign Up',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 14, color: Colors.black))
      ],
    );
  }
}
