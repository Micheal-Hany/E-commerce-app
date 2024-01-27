import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressPageController extends GetxController {
  var isPrimaryAddress = false.obs;

  late TextEditingController nameController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    countryController = TextEditingController();
    cityController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    countryController.dispose();
    cityController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void togglePrimaryAddress(bool value) {
    isPrimaryAddress.value = value;
  }

  backTocartPage() {
    Get.back();
  }
}
