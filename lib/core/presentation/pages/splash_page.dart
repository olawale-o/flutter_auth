import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/core/helper/auth_helper.dart';
import 'package:flutter_auth/core/routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthHelper _authHelper = AuthHelper();
  @override
  Widget build(BuildContext context) {
    if (_authHelper.user == null) {
      Navigator.of(context).pushNamed(login_page);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(home_page, (route) => false);
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Splash page ${_authHelper.user}'),
        ),
      ),
    );
  }
}
