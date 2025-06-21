import 'package:flutter/material.dart';
import 'package:myvault/view/onboarding_pages/splashscreen.dart';
import 'package:myvault/view/signup_pages/otp_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpPage(),
    );
  }
}
