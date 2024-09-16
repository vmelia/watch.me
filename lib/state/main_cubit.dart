import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../contracts.dart';
import '../types.dart';

class MainState extends Equatable {
  const MainState({required this.status, required this.location});
  final Status status;
  final Location location;

  @override
  List<Object?> get props => [status];
}

class MainCubit extends Cubit<MainState> {
  MainCubit(this.geoService) : super(MainState(status: Status.unparked, location: Location.empty()));
  final GeoService geoService;

  void park() async {
    try {
      final location = await geoService.getCurrentLocation();
      emit(MainState(status: Status.parked, location: location));
    } catch (e) {
      // Ignore for now.
    }
  }

  void unpark() async {
    emit(MainState(status: Status.unparked, location: Location.empty()));
  }

  void find() async {
    emit(MainState(status: Status.unparked, location: state.location));
  }
}
