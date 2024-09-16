import 'package:flutter/material.dart';
import 'package:watch_me/view.dart';
import 'services.dart';
import 'state.dart';

void main() {
  configureServices();
  configureState();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'watch.me',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: const WatchPage(),
    );
  }
}
