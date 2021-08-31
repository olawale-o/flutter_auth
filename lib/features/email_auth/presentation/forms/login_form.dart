import 'package:flutter/material.dart';
import 'package:flutter_auth/core/navigation/navigation_bloc.dart';
import 'package:flutter_auth/core/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, AuthState state) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (BuildContext context, AuthState state) {
            if (state is AuthLoaded) {
              BlocProvider.of<NavigationBloc>(context).add(NavigationPop());
              BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationPushReplace(route: dashboard_page, data: state.userModel.user?.email));
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title: Text("Login"),
            ),
            body: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      controller: _email,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email'
                      ),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextField(
                      controller: _password,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password'
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<AuthBloc>(context).add(
                          AuthLoginEvent(
                              email: _email.text, password: _password.text)
                      );
                    },
                    child: Text('Continue'),
                    style: TextButton.styleFrom( textStyle: const TextStyle(fontSize: 24.0,)),),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
