import 'package:flutter/material.dart';
import 'package:flutter_auth/core/helper/auth_helper.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AuthHelper _authHelper = AuthHelper();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: _email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email'
              ),
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password'
              ),
            ),
            TextButton(onPressed: () async {
              print('${_email.text} and ${_password.text}');
              await _authHelper.login(_email.text, _password.text);

            }, child: Text('Continue'))
          ],
        ),
      ),
    );
  }
}
