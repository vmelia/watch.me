import 'package:get_it/get_it.dart';
import 'contracts.dart';
import 'services.dart';

export "services/geo_service_impl.dart";

void configureServices() {
  GetIt.I.registerSingleton<GeoService>(GeoServiceImpl());
}
