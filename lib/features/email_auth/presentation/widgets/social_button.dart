import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialButton extends StatelessWidget {
  final String _logo;
  final String _text;
  final VoidCallback _voidCallback;
  const SocialButton({Key? key,
    required String logo,
    required String text,
    required VoidCallback voidCallback,
  }) : _logo = logo,
      _text = text,
      _voidCallback = voidCallback,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      child: OutlinedButton(
          onPressed: () => _voidCallback,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              children: [
                Image(
                  image: AssetImage(_logo),
                  height: 32.0,
                  width: 32.0,
                ),
                SizedBox(width: 60.0,),
                Text(_text, style: TextStyle(fontSize: 18.0, color: Colors.black54),)
              ],
            ),
          )
      ),
    );
  }
}
