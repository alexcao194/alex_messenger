import 'dart:async';

import 'package:alex_messenger/app/home/presentation/screens/home_screen.dart';
import 'package:alex_messenger/core/services/app_router/app_router.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.9],
              colors: [
                Color(0xFFFC5C7D),
                Color(0xFF6A82FB),
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 90.0),
          child: const Icon(Icons.flutter_dash)
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      AppRouter.pushReplacement(const HomeScreen());
    });
  }
}
