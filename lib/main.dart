import 'package:flutter/material.dart';
import 'package:flutter_password_secrity_app/screens/password_update.dart';
import 'package:flutter_password_secrity_app/screens/pin_add_page.dart';
import 'package:flutter_password_secrity_app/screens/splash_page.dart';

import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashPage(),
    );
  }
}
