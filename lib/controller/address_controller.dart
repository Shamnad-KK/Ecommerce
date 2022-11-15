import 'dart:async';
import 'dart:developer';

import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/services/address_services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends ChangeNotifier {
  AddressController() {
    pickCurrentAddress();
  }
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  double latitude = 0.0;
  double longitude = 0.0;

  bool isLoading = false;

  Set<Marker> markers = {};

  List<AddressModel> addressList = [];

  void addAddress(AddressModel address) {
    addressList.add(address);
    notifyListeners();
  }

  void pickCurrentAddress() async {
    isLoading = true;
    notifyListeners();
    await AddressServices().getCurrentLocation().then((value) async {
      if (value != null) {
        latitude = value.latitude;
        longitude = value.longitude;
        notifyListeners();
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

  final Completer<GoogleMapController> controller = Completer();

  CameraPosition initialLocation = const CameraPosition(
    target: LatLng(11.1518356, 75.8930459),
    zoom: 14.4746,
  );

  void addMarker(double lat, double lon) async {
    markers.clear();
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
