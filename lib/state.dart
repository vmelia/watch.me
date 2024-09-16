import 'package:get_it/get_it.dart';
import 'package:watch_me/state/main_cubit.dart';

export 'state/main_cubit.dart';

void configureState() {
  GetIt.I.registerSingleton<MainCubit>(MainCubit(GetIt.I()));
}