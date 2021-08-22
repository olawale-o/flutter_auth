import 'package:flutter/material.dart';
import 'package:flutter_auth/core/navigation/navigation_bloc.dart';
import 'package:flutter_auth/core/routes/routes.dart';
import 'package:flutter_auth/features/email_auth/presentation/widgets/auth_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthButton(logo: "assets/user.png", text: "User email or phone", page: login_form,),
                  AuthButton(logo: 'assets/google.png', text: "Continue with google" , page: login_form,),
                  AuthButton(logo: "assets/twitter.png", text: "Continue with twitter" , page: login_form,),
                  AuthButton(logo: "assets/facebook.png", text: "Continue with facebook" , page: login_form,),
                ],
              )),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? '),
                    TextButton( onPressed: () => BlocProvider.of<NavigationBloc>(context).add(NavigationPushName(route: signup_page)),
                      child: Text('Sign up'),)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
