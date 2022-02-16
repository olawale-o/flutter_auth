import 'package:flutter/material.dart';
import 'package:flutter_auth/core/blocs/validation/validation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class Button extends StatelessWidget {
  final String _text;
  final VoidCallback _onRequest;
  const Button({
    Key? key,
    required String text,
    required VoidCallback onRequest
  })
  : _text = text,
    _onRequest = onRequest,
    super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValidationCubit, ValidationState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) => state.status.isSubmissionInProgress
          ? CircularProgressIndicator()
          : TextButton(
              onPressed: state.status.isValidated ? () => _onRequest() : null,
              child: Text(_text),
      ),
    );
  }
}
