// ignore_for_file: prefer_const_constructors, deprecated_member_use, curly_braces_in_flow_control_structures

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:login/LoginLayout/LoginLayout.dart';
import 'package:desktop_window/desktop_window.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    await DesktopWindow.setMinWindowSize(Size(850.0, 850.0));
    await DesktopWindow.setMaxWindowSize(Size(850, 850));
  } else
    Platform.isAndroid;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            elevation: 20.0),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
