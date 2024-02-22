import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/binding/initbinding.dart';
import 'package:store_app/controller/Home/wallet_controller.dart';
import 'package:store_app/core/localization/translation.dart';
import 'package:store_app/core/services/Services.dart';
import 'package:store_app/routs.dart';
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
    WalletController walletController = Get.put(WalletController());
    return GetMaterialApp(
      theme: walletController.getCurrantTheme(),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      title: 'Laza',
      getPages: routes,
      initialBinding: InitailBinding(),
      //  home:  CartPageTest(),
    );
  }
}
