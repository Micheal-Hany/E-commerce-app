import 'package:get/get.dart';

abstract class CartController extends GetxController {}

class CartPageControllerImpl extends CartController {
  final RxInt counter = 1.obs;

  addOne() {
    counter.value += 1;
    update();
  }

  minusOne() {
    counter.value == 1 ? counter : counter.value -= 1;
    update();
  }
}
