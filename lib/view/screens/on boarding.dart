import 'package:flutter/material.dart';
import 'package:store_app/view/widgets/on%20boarding/custom%20selider.dart';

import '../widgets/on boarding/Custom button.dart';
import '../widgets/on boarding/dottes controller.dart';

class OnBording extends StatelessWidget {
  const OnBording({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSelider(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    DottesController(),
                    Spacer(
                      flex: 2,
                    ),
                    CustomButtonOnBoarding()
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
