import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store_app/controller/Map_controller.dart';
import 'package:store_app/core/constant/colors.dart';
import 'package:store_app/view/widgets/Home/Custom_cart_icon.dart';
import 'package:store_app/view/widgets/Product_page/CustomButton.dart';

class MapAddressPage extends StatelessWidget {
  const MapAddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.find<MapController>();

    return Scaffold(
      body: GetBuilder<MapController>(
        builder: (controllerpage) {
          return Column(
            children: [
              if (controllerpage.kGooglePlex != null)
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      GoogleMap(
                        mapType: MapType.normal,
                        markers: controllerpage.markers.toSet(),
                        onTap: (LatLng latLng) {
                          mapController.addMarkers(
                              latLng.latitude, latLng.longitude);
                          mapController.getAddressFromLatLng(latLng);
                        },
                        initialCameraPosition: controllerpage.kGooglePlex!,
                        onMapCreated: (GoogleMapController controllermap) {
                          controllerpage.completercontroller!
                              .complete(controllermap);
                        },
                      ),
                      Positioned(
                        top: 25,
                        left: 20,
                        child: Row(
                          children: [
                            CustomCartIcon(
                              backgroundColor: context.theme.cardColor,
                              onPressed: () => controllerpage.goBack(),
                              widget: const Icon(Icons.arrow_back_rounded),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: CustomButton(
                          buttonName: "121".tr,
                          onPressed: () =>
                              controllerpage.addAddressToDatabase(),
                          backgroundColor: ColorConstant.primary,
                          width: 200,
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
