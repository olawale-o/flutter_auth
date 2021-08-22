import 'package:flutter/material.dart';
import 'package:flutter_auth/core/helper/auth_helper.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  AuthHelper _authHelper = AuthHelper();
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
            TextButton(onPressed: () async {
              print('${_email.text} and ${_password.text}');
              await _authHelper.signUp(_email.text, _password.text);
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
