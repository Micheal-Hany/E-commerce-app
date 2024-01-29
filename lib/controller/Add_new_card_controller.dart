import 'package:get/get.dart';

class AddNewcardController extends GetxController {
  List<String> cards = [
    "assets/images/master_card.png",
    "assets/images/paypal.png",
    "assets/images/bank.png"
  ];

  String currentSelected = '';

  @override
  void onInit() {
    currentSelected = cards.first;
    super.onInit();
  }

  void setSelectedTypeCard(int index) {
    currentSelected = cards[index];
    update(); // Notify GetBuilder to rebuild the UI
  }

  bool isCardSelected(int index) {
    return currentSelected == cards[index];
  }

  backToPaymentPage() {
    Get.back();
  }
}
