import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/address_model.dart';
import 'package:store_app/core/class/status%20request.dart';

class MapController extends GetxController {
  Completer<GoogleMapController>? completercontroller;
  StatusRequest statusRequest = StatusRequest.none;
  List<Marker> markers = [];
  double? lat;
  double? long;
  Position? position;
  CameraPosition? kGooglePlex;
  AddressModel? addressModel;

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  void _init() async {
    await _determineAndSetPosition();
    completercontroller = Completer<GoogleMapController>();
  }

  Future<void> _determineAndSetPosition() async {
    statusRequest = StatusRequest.loading;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // Request location permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Location permissions are denied.
        _showErrorDialog('Location permissions are denied.');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Location permissions are permanently denied.
      _showErrorDialog(
          'Location permissions are permanently denied, we cannot request permissions.');
      return;
    }

    try {
      // Get current position
      position = await Geolocator.getCurrentPosition();
      kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 14.4746,
      );
      addMarkers(position!.latitude, position!.longitude);
      statusRequest = StatusRequest.success;
      update();
    } catch (e) {
      _showErrorDialog('Error getting current location: $e');
    }
  }

  void _showErrorDialog(String message) {
    Get.defaultDialog(
      titleStyle: TextStyle(color: ColorConstant.primary),
      middleTextStyle: TextStyle(color: ColorConstant.primary),
      title: 'Error',
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('OK'),
        ),
      ],
    );
  }

  void addMarkers(double latitude, double longitude) async {
    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId("1"),
      position: LatLng(latitude, longitude),
      infoWindow: InfoWindow(title: '126'.tr),
    ));

    lat = latitude;
    long = longitude;
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    addressModel = AddressModel.fromPlacemark(placemarks[0]);
    update();
  }

  void addAddressToDatabase() async {
    await DBHelper.instance().insertAddress("addresses", addressModel!);
  }

  void goBack() {
    Get.back();
  }

  Future<String> getAddressFromLatLng(LatLng latLng) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    if (placemarks.isNotEmpty) {
      Placemark place = placemarks[0];
      String address =
          "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";

      return address;
    } else {
      return "Address not found";
    }
  }
}
