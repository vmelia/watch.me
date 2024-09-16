import 'package:geolocator/geolocator.dart';

import '../contracts.dart';
import '../types.dart';

class GeoServiceImpl implements GeoService {
  @override
  Future<Location> getCurrentLocation() async {
    final permission = await checkPermission();
    if (permission != Permission.allowed) {
      throw Exception();
    }

    final position = await Geolocator.getCurrentPosition();
    return Location(position.latitude, position.longitude);
  }

  @override
  Future<Permission> checkPermission() async {
    LocationPermission permission;

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Permission.disabled;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Permission.denied;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Permission.deniedForever;
    }

    return Permission.allowed;
  }
}
