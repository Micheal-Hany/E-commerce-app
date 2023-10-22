import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/localization/translation.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/routs.dart';
import 'package:store_app/view/screens/language.dart';
import 'package:store_app/view/widgets/language/change_Language.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColor.black),
            bodyLarge: TextStyle(
                height: 2,
                color: AppColor.grey,
                fontWeight: FontWeight.bold,
                fontSize: 17)),
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      // home: const OnBording(),
      home: const Language(),
    );
  }
}
