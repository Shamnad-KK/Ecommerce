import 'dart:async';
import 'dart:developer';

import 'package:ecommerce/helpers/app_colors.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/routes/route_names.dart';
import 'package:ecommerce/services/address_services.dart';
import 'package:ecommerce/utils/app_popups.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressController extends ChangeNotifier {
  AddressController() {
    getAllAddresses();
  }
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final Completer<GoogleMapController> controller = Completer();

  double latitude = 0.0;
  double longitude = 0.0;

  bool isLoading = false;

  Set<Marker> markers = {};

  List<AddressModel>? addressList;

  void addAddress(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    final address = AddressModel(
        name: nameController.text,
        address: addressController.text,
        pincode: int.parse(pinCodeController.text),
        city: cityController.text,
        phone: int.parse(phoneController.text));

    await AddressServices().addAddress(address).then((value) {
      if (value == true) {
        AppPopUps.showToast(
            'Address added successfully', AppColors.successColor);
        getAllAddresses();
        Navigator.of(context).pushReplacementNamed(RouteNames.addressScreen);
        isLoading = true;
        notifyListeners();
      }
    });

    isLoading = false;
    notifyListeners();
  }

  void getAllAddresses() async {
    isLoading = true;
    notifyListeners();
    await AddressServices().getAllAddresses().then((value) {
      if (value != null) {
        addressList = value;
        isLoading = false;
        notifyListeners();
      }
    });
    isLoading = false;
    notifyListeners();
  }

  void removeAddress(String addressId, BuildContext context) {
    AppPopUps.deletePopUp(context, 'address', () async {
      isLoading = true;
      notifyListeners();
      await AddressServices().removeAddress(addressId).then((value) {
        if (value == true) {
          getAllAddresses();
          Navigator.of(context).pop();
          AppPopUps.showToast('Address removed', AppColors.successColor);
        }
      });
      isLoading = false;
      notifyListeners();
    });
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
  String? nameValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter name';
    } else if (value.startsWith(RegExp('[0-9]'))) {
      return 'Please enter a valid name';
    }
    return null;
  }

  String? addressValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter address';
    }
    return null;
  }

  String? pincodeValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter pincode';
    }
    return null;
  }

  String? cityValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter city';
    }
    return null;
  }

  String? phoneValidation(String? value) {
    if (value!.isEmpty) {
      return 'Please enter mobile number';
    } else if (value.length < 10) {
      return 'Please enter a valid mobile number';
    }
    return null;
  }
}
