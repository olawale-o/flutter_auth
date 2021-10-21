import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController _controller;
  final Stream _stream;
  final Function(String string) _validator;
  final String _label;
  const InputField({
    Key? key,
    required TextEditingController controller,
    required Stream stream,
    required Function(String string) validator,
    required String label
  }) : _controller = controller,
       _stream = stream,
       _validator = validator,
        _label = label,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child:  StreamBuilder(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) => TextField(
          controller: _controller,
          onChanged: (value) => _validator(value),
          decoration: InputDecoration(
              errorText: snapshot.error != null ? "${snapshot.error}" : null,
              border: OutlineInputBorder(),
              labelText: _label
          ),
        ),
      ),
    );
  }
}
