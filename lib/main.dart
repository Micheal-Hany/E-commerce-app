import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/binding/initbinding.dart';
import 'package:store_app/core/constant/App%20Theme.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/localization/translation.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/routs.dart';
import 'package:store_app/test.dart';
import 'package:store_app/view/screens/language.dart';
import 'package:store_app/view/test_view.dart';
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
        theme: controller.appTheme,
        //getPages: routes,
        initialBinding: InitailBinding(),
        home: const TestView());
  }
}
