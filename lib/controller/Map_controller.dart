import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app/controller/ViewAvailableAddressesController.dart';
import 'package:store_app/core/class/status%20request.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:store_app/core/function/custom_snackbar.dart';
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

    LocationPermission permission;

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
    AddressModel? address =
        await DBHelper.instance().getAddressById(addressModel.id, "addresses");
    if (address != null) {
      customSnackbar(
        "155".tr,
        "",
      );
    } else {
      await DBHelper.instance().insertAddress("addresses", addressModel);
      customSnackbar(
        "127".tr,
        "",
      );
    }
  }

  goBack() {
    viewAvailableAddressesController.getAllAddresses();
    Get.back();
  }
}
