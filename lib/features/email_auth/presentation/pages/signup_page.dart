import 'package:flutter/material.dart';
import 'package:flutter_auth/core/navigation/navigation_bloc.dart';
import 'package:flutter_auth/core/routes/routes.dart';
import 'package:flutter_auth/features/email_auth/presentation/widgets/auth_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Register'),
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
                    Text('Already have an account? '),
                    TextButton( onPressed: () => BlocProvider.of<NavigationBloc>(context).add(NavigationPushName(route: login_page)),
                      child: Text('Log in'),)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
