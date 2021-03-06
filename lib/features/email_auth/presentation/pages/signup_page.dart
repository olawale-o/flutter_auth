import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/navigation/navigation_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../bloc/register_bloc.dart';
import '../widgets/auth_button.dart';


import '../../../../injection_container.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (_) => s1<RegisterBloc>(),
        child: Scaffold(
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
                      AuthButton(logo: "assets/user.png", text: "User email or phone", voidCallback: () =>
                          BlocProvider.of<NavigationBloc>(context).add(NavigationPushName(route: signup_form)),),
                      // AuthButton(logo: 'assets/google.png', text: "Continue with google" , page: login_form,),
                      // AuthButton(logo: "assets/twitter.png", text: "Continue with twitter" , page: login_form,),
                      // AuthButton(logo: "assets/facebook.png", text: "Continue with facebook" , page: login_form,),
                    ],
                  )),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account? '),
                        TextButton( onPressed: () => BlocProvider.of<NavigationBloc>(context)
                            .add(NavigationPushReplace(route: login_page)),
                          child: Text('Log in'),)
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
    );
  }
}
