import 'package:get/get.dart';
import 'package:store_app/core/class/crud.dart';

class InitailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
