import 'package:ecommerce/model/address_model.dart';
import 'package:ecommerce/services/address_services.dart';
import 'package:flutter/material.dart';

class AddressController extends ChangeNotifier {
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  bool isLoading = false;

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
        await AddressServices()
            .getCordinates(value.latitude, value.longitude)
            .then(
          (address) {
            if (address != null) {
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
}
