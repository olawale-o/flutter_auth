import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login_bloc.dart';
import '../../../../core/blocs/validation_bloc.dart';
import '../../../../core/navigation/navigation_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../../../../injection_container.dart';
import '../widgets/input_field.dart';
import '../bloc/auth_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool shouldPop = false;
  late ValidationBloc _validationBloc;
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final FocusNode focusNode = FocusNode();

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
  
  void _onLogin(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(NormalLoginEvent(args: {'email': _email.text, 'password': _password.text}));
  }

  showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }



  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => s1<LoginBloc>(),
       child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, LoginState state) {
            return BlocListener<LoginBloc, LoginState>(
              listener: (BuildContext context, LoginState state) {
                if (state is LoginSuccess) {
                  BlocProvider.of<NavigationBloc>(context).add(NavigationPop());
                  BlocProvider.of<NavigationBloc>(context)
                      .add(NavigationPushReplace(route: dashboard_page, data: state.userModel.email));
                }

                if (state is LoginFailure) {
                  showSnackBar(context, state.message);
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
                        InputField(
                            controller: _email,
                            stream: _validationBloc.email$,
                            validator: (value) => _validationBloc.onChangeEmail(value),
                            label: 'Email'
                        ),
                        InputField(
                            controller: _password,
                            stream: _validationBloc.password$,
                            validator: (value) => _validationBloc.onChangePassword(value),
                            label: 'Password',
                            obscureText: true,
                        ),
                        BlocBuilder<LoginBloc, LoginState>(builder: (BuildContext context, LoginState state) {
                          if (state is LoginLoading) {
                            return CircularProgressIndicator();
                          }
                          return StreamBuilder(
                              stream: _validationBloc.validSubmit,
                              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                return TextButton(
                                  onPressed: () => snapshot.data == true ? _onLogin(context)  : null,
                                  child: Text('Continue'),);
                              }
                          );
                        }),

                        BlocBuilder<AuthBloc, AuthState>(builder: (BuildContext context, AuthState state) {
                          if (state is AuthError) {
                            return Text(state.message);
                          }
                          return Center();
                        })
                      ],
                    ),
                  ),
              ),
            );
          },
        ),
    );
  }
}
