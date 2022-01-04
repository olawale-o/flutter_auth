import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/blocs/validation_bloc.dart';
import '../../../../core/navigation/navigation_bloc.dart';
import '../../../../core/routes/routes.dart';
import '../bloc/register_bloc.dart';
import '../../../../injection_container.dart';
import '../widgets/input_field.dart';

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
  }

  showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
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
                  .add(NavigationPushReplace(route: dashboard_page, data: state.userModel.email));
                }
              if (state is RegisterFailure) {
                  showSnackBar(context, state.message);
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
                        BlocBuilder<RegisterBloc, RegisterState>(builder: (BuildContext context, RegisterState state) {
                          if (state is RegisterLoading) {
                            return CircularProgressIndicator();
                          }
                          return StreamBuilder(
                              stream: _validationBloc.validSubmit,
                              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                                return TextButton(
                                  onPressed: () => snapshot.data == true ? _onRegister(context)  : null,
                                  child: Text('Create'),);
                              }
                          );
                        }),
                      ],
                    ),
                  ),
            )
          ),
    );
  }
}
