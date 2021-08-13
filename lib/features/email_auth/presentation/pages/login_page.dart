import 'package:flutter/material.dart';
import 'package:flutter_auth/features/email_auth/presentation/widgets/auth_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login Page'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthButton(logo: "assets/user.png", text: "User email or phone"),
              AuthButton(logo: 'assets/google.png', text: "Continue with google"),
              AuthButton(logo: "assets/twitter.png", text: "Continue with twitter"),
              AuthButton(logo: "assets/facebook.png", text: "Continue with facebook"),
            ],
          ),
        )
    );
  }
}
