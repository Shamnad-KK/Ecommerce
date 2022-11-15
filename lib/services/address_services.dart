import 'package:ecommerce/config/app_exceptions.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

class AddressServices {
  Future<Position?> getCurrentLocation() async {
    try {
      LocationPermission permission;
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
