import 'dart:async';
import 'dart:developer';

import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/services/address_services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends ChangeNotifier {
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  final Completer<GoogleMapController> controller = Completer();

  double latitude = 0.0;
  double longitude = 0.0;

  bool isLoading = false;

  Set<Marker> markers = {};

  List<AddressModel> addressList = [];

  void addAddress(AddressModel address) {
    addressList.add(address);
    notifyListeners();
  }

  CameraPosition cameraPosition = const CameraPosition(
    target: LatLng(61.1518356, 75.8930459),
    zoom: 14.4746,
  );

  void setCurrentLocation() async {
    await AddressServices().getCurrentLocation().then((value) async {
      if (value != null) {
        log(value.latitude.toString());
        cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude),
          zoom: 15.4746,
        );
        notifyListeners();

        GoogleMapController newController = await controller.future;
        newController
            .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

        log(cameraPosition.toString());
      }
    });
  }

  void pickCurrentAddress() async {
    isLoading = true;
    notifyListeners();
    await AddressServices().getCurrentLocation().then((value) async {
      if (value != null) {
        latitude = value.latitude;
        longitude = value.longitude;

        await AddressServices().getCordinates(latitude, longitude).then(
          (address) {
            if (address != null) {
              log(value.toString());
              addressController.text = address.streetAddress!;
              pinCodeController.text = address.postal!;
              cityController.text = address.region!;
            }
          },
        );
      }
    });

    isLoading = false;
    notifyListeners();
  }

  void addMarker(double lat, double lon) async {
    markers.clear();
    notifyListeners();
    markers.add(
      Marker(
          markerId: const MarkerId('defaultLocation'),
          position: LatLng(lat, lon)),
    );
    notifyListeners();
    await AddressServices().getCordinates(lat, lon).then(
      (address) {
        if (address != null) {
          addressController.text = address.streetAddress!;
          pinCodeController.text = address.postal!;
          cityController.text = address.region!;
        }
      },
    );
    notifyListeners();
  }

  // final CameraPosition kLake = const CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
}
