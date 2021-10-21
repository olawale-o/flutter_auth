import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../../../../core/navigation/navigation_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../../../../injection_container.dart';
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
    return BlocProvider<LoginBloc>(
      create: (_) => s1<LoginBloc>(),
      child: BlocListener<LoginBloc, LoginState>(
            listener: (BuildContext context, LoginState state) {
              if (state is LoginSuccess) {
                BlocProvider.of<NavigationBloc>(context).add(NavigationPop());
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigationPushName(route: dashboard_page, data: state.userModel.user?.email));
              }
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Text('Login Page'),
                ),
                body: Container(
                  padding: const EdgeInsets.all(35.0),
                  child: Column(
                    children: [
                      Expanded(child: ListView(
                        children: [
                          Column(
                            children: [
                              AuthButton(logo: "assets/user.png",
                                text: "User email or phone",
                                voidCallback: () =>
                                    BlocProvider.of<NavigationBloc>(context).add(NavigationPushName(route: login_form)),),
                              Builder(
                                builder: (context) {
                                  return SocialButton(logo: 'assets/google.png',
                                      text: "Continue with google",
                                      voidCallback: () => BlocProvider.of<LoginBloc>(context).add(GoogleSigInEvent())
                                  );
                                }
                              ),
                              SocialButton(logo: "assets/twitter.png",
                                  text: "Continue with twitter",
                                  voidCallback: () => print('twitter')),
                              Builder(
                                builder: (context) {
                                  return SocialButton(logo: "assets/facebook.png",
                                      text: "Continue with facebook",
                                      voidCallback: () => BlocProvider.of<LoginBloc>(context).add(FacebookSigInEvent()));
                                }
                              ),
                            ],
                          )
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
                                    .add(NavigationPushReplace(route: signup_page)),
                              child: Text('Sign up'),)
                          ],
                        ),
                      )
                    ],
                  ),
                )
            )),
    );
  }
}
