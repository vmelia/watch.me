import '../types.dart';

abstract class GeoService {
  Future<Permission> checkPermission();
  Future<Location> getCurrentLocation();
}
