import 'dart:async';

import 'package:flutter/material.dart';
import 'package:games_organizing/core/resources/manager_assets.dart';
import 'package:games_organizing/features/near_coffee/domain/coffee_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CoffeeDetailsController extends GetxController {
  final Completer<GoogleMapController> mapController = Completer();
  Set<Marker> markers = <Marker>{};
// Create a method to load the custom icon asynchronously
  Future<BitmapDescriptor> getCustomIcon() async {
    return await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        devicePixelRatio: 1,
      ),
      ManagerAssets.coffeeMarker,
    );
  }

  void addMarkers({CoffeeModel? coffeeModel}) async {
    // Call the method to get the custom icon
    BitmapDescriptor customIcon = await getCustomIcon();
    MarkerId markerId = MarkerId(1.toString());
    Marker marker = Marker(
      markerId: markerId,
      icon: customIcon,
      position: LatLng(
          coffeeModel!.coffePlace!.latitude, coffeeModel.coffePlace!.longitude),
      infoWindow: InfoWindow(
        title: coffeeModel.coffeeName,
        snippet: coffeeModel.coffeeDescription,
      ),
    );
    markers.add(marker);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    markers.clear();
  }
}
