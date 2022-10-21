import 'package:ecommerce/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressController extends ChangeNotifier {
  TextEditingController addressController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController landMarkController = TextEditingController();

  List<Address> addressList = [];

  void addAddress(Address address) {
    addressList.add(address);
    notifyListeners();
  }
}
