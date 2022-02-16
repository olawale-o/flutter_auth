import 'package:flutter/material.dart';
import 'package:flutter_auth/core/widgets/button.dart';
import 'package:flutter_auth/core/widgets/email_input.dart';
import 'package:flutter_auth/core/widgets/password_input.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../../core/blocs/validation/validation_cubit.dart';
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
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  void _onLogin(BuildContext context) {
    context.read<LoginBloc>().add(NormalLoginEvent(args: {'email': _email.text, 'password': _password.text}));
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
            child: BlocProvider<ValidationCubit>(
              create: (_) => s1<ValidationCubit>(),
              child: Scaffold(
                  appBar: AppBar(title: Text("Login"),),
                  body: Container(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        EmailInput(controller: _email),
                        PasswordInput(controller: _password),
                        Button(text: 'Continue', onRequest: () => _onLogin(context))
                      ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

