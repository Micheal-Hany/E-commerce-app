import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/firebase_options.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initServices() async {
  await DBHelper.instance().initDatabase();
  await Get.putAsync(() => MyServices().init());
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Handle the error as needed
  }
  // await Firebase.initializeApp();
}
