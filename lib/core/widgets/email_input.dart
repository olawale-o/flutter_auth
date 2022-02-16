import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/email_auth/presentation/widgets/input_field.dart';
import '../blocs/validation/validation_cubit.dart';

class EmailInput extends StatelessWidget {
  final TextEditingController _controller;
  const EmailInput({Key? key, required TextEditingController controller})
  : _controller = controller,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) => InputField(
          key: const Key('loginForm_emailInput_textField'),
          controller: _controller,
          validator: (value) => context.read<ValidationCubit>().emailChanged(value),
          label: 'Email address',
          message: 'Invalid email',
          keyBoardType: TextInputType.emailAddress,
          invalid: state.email.invalid ,
        )
    );
  }
}
