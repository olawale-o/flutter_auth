import 'package:flutter/material.dart';
import 'package:flutter_auth/features/email_auth/presentation/bloc/auth_bloc.dart';

import '../../../../injection_container.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register form"),
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
            TextButton(onPressed: () {
              print('${_email.text} and ${_password.text}');
              s1<AuthBloc>().add(
                  AuthSignUpEvent(email: _email.text, password: _password.text)
              );
            }, child: Text('Continue'),
              style: TextButton.styleFrom(
                  textStyle: const TextStyle( fontSize: 24.0,)
              ),
            )
          ],
        ),
      ),
    );
  }
}
