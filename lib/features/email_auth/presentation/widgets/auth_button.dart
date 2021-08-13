import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String logo;
  final String text;
  const AuthButton({Key? key, required this.logo, required this. text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: () => {
          print("pressed")
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Image(
                image: AssetImage(logo),
                height: 32.0,
                width: 32.0,
              ),
              SizedBox(width: 60.0,),
              Text(text, style: TextStyle(fontSize: 18.0),)
            ],
          ),
        )
    );
  }
}
