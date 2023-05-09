import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:helal/views/bottom_navigation_bar.dart';
import 'package:helal/views/home_screen.dart';
import 'package:helal/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    _checkLogin();
  }

  _checkLogin() async {
    Future.delayed(const Duration(milliseconds: 3000), () async {
      bool exists =
          await const FlutterSecureStorage().containsKey(key: "token");

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                exists ? const BottomNavigation() : const LoginScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Image.asset("assets/images/e-logo.PNG", fit: BoxFit.cover),
        ),
      ),
    );
  }
}
