import 'package:flutter/material.dart';
import 'package:flutter_auth/features/email_auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/navigation/navigation_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../widgets/social_button.dart';
import '../widgets/auth_button.dart';

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
                      AuthButton(logo: "assets/user.png",
                        text: "User email or phone",
                        page: login_form,),
                      SocialButton(logo: 'assets/google.png',
                          text: "Continue with google",
                          voidCallback: () => print('google')),
                      SocialButton(logo: "assets/twitter.png",
                          text: "Continue with twitter",
                          voidCallback: () => print('twitter')),
                      SocialButton(logo: "assets/facebook.png",
                          text: "Continue with facebook",
                          voidCallback: () => print('facebook')),
                    ],
                  )),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account? '),
                        TextButton(onPressed: () =>
                            BlocProvider.of<NavigationBloc>(context)
                                .add(NavigationPushName(route: signup_page)),
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
