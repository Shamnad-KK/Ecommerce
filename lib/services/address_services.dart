import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecommerce/config/app_exceptions.dart';
import 'package:ecommerce/constants/app_url.dart';
import 'package:ecommerce/model/address_model.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

class AddressServices {
  Future<bool> addAddress(AddressModel address) async {
    try {
      Dio dio = Dio();
      const url = 'http://${AppUrls.host}:6000/api/v1/profile/address';
      Response response = await dio.post(
        url,
        data: address.toJson(),
      );

      log(response.statusCode.toString());

      if (response.statusCode! >= 201 && response.statusCode! <= 299) {
        log('kuu');
        log(response.data['success'].toString());
        return response.data['success'];
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return false;
  }

  Future<List<AddressModel>?> getAllAddresses() async {
    try {
      Dio dio = Dio();
      const url = 'http://${AppUrls.host}:6000/api/v1/profile/address';
      Response response = await dio.get(
        url,
      );

      if (response.statusCode! == 200) {
        log(response.data.toString());
        List<AddressModel> addressList = (response.data as List)
            .map((e) => AddressModel.fromJson(e))
            .toList();
        return addressList;
      }
      if (response.statusCode! == 204) {
        return <AddressModel>[];
      } else {
        return null;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<bool> removeAddress(String addressId) async {
    try {
      Dio dio = Dio();
      final url =
          'http://${AppUrls.host}:6000/api/v1/profile/address/$addressId';
      Response response = await dio.delete(
        url,
      );

      if (response.statusCode! == 202) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return false;
  }

  Future<Position?> getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return Future.error("Location permission are denied");
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error("Location permission are denied");
        }
        return null;
      } else {
        return await Geolocator.getCurrentPosition();
      }
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }

  Future<Address?> getCordinates(double latitude, double longitude) async {
    try {
      Address address = await GeoCode()
          .reverseGeocoding(latitude: latitude, longitude: longitude);
      return address;
    } catch (e) {
      AppExceptions.handleError(e);
    }
    return null;
  }
}
