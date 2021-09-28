import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/blocs/validation_bloc.dart';
import '../../../../core/navigation/navigation_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../bloc/register_bloc.dart';
import '../../../../injection_container.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  late ValidationBloc _validationBloc;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _validationBloc = ValidationBloc();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _onRegister(BuildContext context) {
    BlocProvider.of<RegisterBloc>(context).add(NormalRegisterEvent(email: _email.text, password: _password.text));
    _email.clear();
    _password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (_) => s1<RegisterBloc>(),
      child: BlocListener<RegisterBloc, RegisterState>(
            listener: (BuildContext context, RegisterState state) {
              if (state is RegisterSuccess) {
                BlocProvider.of<NavigationBloc>(context).add(NavigationPop());
                BlocProvider.of<NavigationBloc>(context)
                  .add(NavigationPushReplace(route: dashboard_page, data: state.userModel.user?.email));
                }
              },
            child: Scaffold(
                  appBar: AppBar(
                    title: Text("Register form"),
                  ),
                  body: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: StreamBuilder(
                            stream: _validationBloc.email$,
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) => TextField(
                              controller: _email,
                              onChanged: (value) => _validationBloc.onChangeEmail(value),
                              decoration: InputDecoration(
                                  errorText: snapshot.error != null ? "${snapshot.error}" : null,
                                  border: OutlineInputBorder(),
                                  labelText: 'Email'
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          child: StreamBuilder(
                            stream: _validationBloc.password$,
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) => TextField(
                              controller: _password,
                              onChanged: (value) => _validationBloc.onChangePassword(value),
                              obscureText: true,
                              decoration: InputDecoration(
                                  errorText: snapshot.error != null ? "${snapshot.error}" : null,
                                  border: OutlineInputBorder(),
                                  labelText: 'Password'
                              ),),
                          ),
                        ),
                        StreamBuilder(
                            stream: _validationBloc.validSubmit,
                            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                              return TextButton(
                                onPressed: () => snapshot.data == true ? _onRegister(context) : null,
                                child: Text('Create'),);
                            }
                        ),
                      ],
                    ),
                  ),
            )
          ),
    );
  }
}
