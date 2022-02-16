import 'package:flutter/material.dart';
import 'package:flutter_auth/core/blocs/validation/validation_cubit.dart';
import 'package:flutter_auth/core/widgets/button.dart';
import 'package:flutter_auth/core/widgets/email_input.dart';
import 'package:flutter_auth/core/widgets/password_input.dart';
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
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();


  void _onRegister(BuildContext context) {
    context.read<RegisterBloc>().add(NormalRegisterEvent(email: _email.text, password: _password.text));
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
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return BlocListener<RegisterBloc, RegisterState>(
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
                child: BlocProvider<ValidationCubit>(
                         create: (_) => s1<ValidationCubit>(),
                         child: Scaffold(
                            appBar: AppBar(title: Text("Register form"),),
                            body: Container(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  EmailInput(controller: _email),
                                  PasswordInput(controller: _password),
                                  Button(text: 'Create', onRequest: () => _onRegister(context))
                                ],
                              ),
                            ),
                         ),
                    )
                );
        }
      ),
      );
    }
}
