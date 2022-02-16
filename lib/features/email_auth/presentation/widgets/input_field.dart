import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController _controller;
  final Function(String string) _validator;
  final String _label;
  final bool _obscureText;
  final TextInputType? _keyBoardType;
  final bool _invalid;
  final String _message;
  const InputField({
    Key? key,
    required TextEditingController controller,
    required Function(String string) validator,
    required String label,
    TextInputType? keyBoardType,
    bool obscureText = false,
    bool invalid = false,
    String message = ''

  }) : _controller = controller,
       _validator = validator,
        _label = label,
        _keyBoardType = keyBoardType,
        _obscureText = obscureText,
        _invalid = invalid,
        _message = message,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
          controller: _controller,
          onChanged: (value) => _validator(value),
          obscureText: _obscureText,
          keyboardType: _keyBoardType != null ? _keyBoardType : null,
          decoration: InputDecoration(
              errorText: _invalid ? _message : null,
              border: OutlineInputBorder(),
              labelText: _label,
          ),
        ),
    );
  }
}
