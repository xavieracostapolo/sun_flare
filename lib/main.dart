import 'package:flutter/material.dart';
import 'package:sun_flare/application/app.dart';
import 'package:sun_flare/application/dependencies/locator.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await init();
  setUp();
  runApp(const App());
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'TestFlutterCrud',
      options: const FirebaseOptions(
          appId: '1:387400200188:android:de7eb76d3793543d3d0c79',
          apiKey: 'AIzaSyAnkz7YKc-ntT18c9VJPqwp_oM0s0HZh1I',
          messagingSenderId: '',
          projectId: 'testfluttercrud'));
}
