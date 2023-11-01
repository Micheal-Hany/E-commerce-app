import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:store_app/core/function/internet_check.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  var res;
  check() async {
    res = await checkInternet();
    print(res);
  }

  @override
  void initState() {
    check();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test"),
      ),
      body: Container(
        child: OtpTextField(
          borderRadius: BorderRadius.circular(15), clearText: true,
          fieldWidth: 50,
          numberOfFields: 5,
          borderColor: Colors.black,
          //set to true to show as box or false to show as dash
          showFieldAsBox: true,
          //runs when a code is typed in
          onCodeChanged: (String code) {
            //handle validation or checks here
          },
          //runs when every textfield is filled
          onSubmit: (String verificationCode) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                });
          }, // end onSubmit
        ),
      ),
    );
  }
}
