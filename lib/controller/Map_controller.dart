import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:store_app/core/services/sqlite_servise.dart';
import 'package:store_app/data/model/address_model.dart';

class MapController extends GetxController {
  ViewAvailableAddressesController viewAvailableAddressesController =
      Get.put(ViewAvailableAddressesController());
  Completer<GoogleMapController>? completercontroller;
  StatusRequest statusRequest = StatusRequest.none;
  List<Marker> markers = [];
  double? lat;
  double? long;
  Position? position;
  CameraPosition? kGooglePlex;
  AddressModel? addressModel;

  @override
  void onInit() async {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _determineAndSetPosition();
    });

    completercontroller = Completer<GoogleMapController>();
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

  Future<void> _determineAndSetPosition() async {
    position = await _determinePosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    addMarkers(position!.latitude, position!.longitude);

    update();
  }

  Future<Position> _determinePosition() async {
    statusRequest = StatusRequest.loading;
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await _showEnableLocationDialog();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    statusRequest = StatusRequest.success;
    return await Geolocator.getCurrentPosition();
  }

  Future<void> _showEnableLocationDialog() async {
    bool? enableLocation = await Get.defaultDialog<bool>(
      title: 'Location Services Disabled',
      content: const Text('Please enable location services to continue.'),
      actions: [
        TextButton(
          onPressed: () => Get.back(result: true),
          child: const Text('Enable'),
        ),
        TextButton(
          onPressed: () => Get.back(result: false),
          child: const Text('Cancel'),
        ),
      ],
    );

    if (enableLocation!) {
      await Geolocator.openAppSettings();
    } else {
      throw Exception('Location services are disabled.');
    }
  }

  void _handleLocationError(dynamic e) {
    if (e is Exception &&
        e.toString().contains('Location services are disabled.')) {
      _showEnableLocationDialog();
    } else {
      _showErrorDialog('Error determining position: $e');
    }
  }

  void _showErrorDialog(String message) {
    Get.defaultDialog(
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
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    addressModel = AddressModel.fromPlacemark(placemarks[0]);
    lat = latitude;
    long = longitude;
    update();
  }

  void addAddressToDatabase(AddressModel addressModel) async {
    await DBHelper.instance().insertAddress("addresses", addressModel);
  }

  goBack() {
    viewAvailableAddressesController.getAllAddresses();
    Get.back();
  }
}
