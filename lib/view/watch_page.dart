import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../state.dart';
import '../types.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mainCubit = GetIt.I<MainCubit>();

    return BlocProvider(
      create: (BuildContext context) => mainCubit,
      child: BlocBuilder<MainCubit, MainState>(
        bloc: mainCubit,
        builder: (context, state) => _PageBody(state: state),
      ),
    );
  }
}

class _PageBody extends StatelessWidget {
  const _PageBody({required this.state});
  final MainState state;

  @override
  Widget build(BuildContext context) {
    final mainCubit = GetIt.I<MainCubit>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () => mainCubit.park(),
                ),
                FloatingActionButton(
                  onPressed: () => mainCubit.park(),
                ),
              ],
            ),
            Text(_locationToText(state.location)),
          ],
        ),
      ),
    );
  }

  String _locationToText(Location location) => '(${location.latitude}, ${location.longitude})';
}
