import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/email_auth/presentation/widgets/input_field.dart';
import '../blocs/validation/validation_cubit.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController _controller;
  const PasswordInput({Key? key, required TextEditingController controller})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) => InputField(
          key: const Key('loginForm_passwordInput_textField'),
          controller: _controller,
          validator: (value) => context.read<ValidationCubit>().passwordChanged(value),
          label: 'Password',
          message: 'Invalid password',
          invalid: state.password.invalid,
          obscureText: true,
        )
    );
  }
}
