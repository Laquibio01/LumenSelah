import 'dart:async';
import 'package:flutter/material.dart';
import 'main_navigation.dart';


typedef SplashFinishCallback = void Function();

class SplashScreen extends StatefulWidget {
  final SplashFinishCallback? onFinish;
  const SplashScreen({Key? key, this.onFinish}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 3500), () {
      if (widget.onFinish != null) {
        widget.onFinish!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 44, 54),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/splash/SelahLogo.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 24),
            const Text(
              'Lumen Selah',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
