import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/address_model.dart';

class AddressPageController extends GetxController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  var isPrimaryAddress = false.obs;
  AddressModel? model;
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

  getAddressModel() {
    model = AddressModel(
        id: Random().nextInt(10000),
        street: cityController.text,
        subLocality: "",
        locality: addressController.text,
        postalCode: "",
        address: addressController.text,
        name: nameController.text,
        phoneNumber: phoneNumberController.text,
        country: countryController.text);
    return model;
  }

  // saveAddress() {}
  void addAddressToDatabase() async {
    if (formState.currentState!.validate()) {
      AddressModel model = getAddressModel();
      try {
        await DBHelper.instance().insertAddress("addresses", model);
        print('Address added to the database successfully.');
      } catch (e) {
        print('Error adding address to the database: $e');
      }
    }
  }
}
