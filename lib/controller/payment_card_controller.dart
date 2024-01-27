import 'package:flutter_credit_card/flutter_credit_card.dart'
    as flutter_credit_card;
import 'package:get/get.dart';

class CreditCardController extends GetxController {
  RxString cardNumber = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString cvvCode = ''.obs;
  RxBool isCvvFocused = false.obs;
  var isPrimaryAddress = false.obs;

  void onCreditCardModelChange(
      flutter_credit_card.CreditCardModel creditCardModel) {
    cardNumber.value = creditCardModel.cardNumber ?? '';
    expiryDate.value = creditCardModel.expiryDate ?? '';
    cardHolderName.value = creditCardModel.cardHolderName ?? '';
    cvvCode.value = creditCardModel.cvvCode ?? '';
    isCvvFocused.value = creditCardModel.isCvvFocused ?? false;
  }

  backTocartPage() {
    Get.back();
  }

  void togglePrimaryAddress(bool value) {
    isPrimaryAddress.value = value;
  }
}
