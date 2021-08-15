import 'package:flutter/material.dart';
import 'package:flutter_auth/core/navigation/navigation_bloc.dart';
import 'package:flutter_auth/core/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthButton extends StatelessWidget {
  final String logo;
  final String text;
  final String page;
  const AuthButton({Key? key,
    required this.logo, required this.text, required this.page
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.0),
      child: OutlinedButton(
          onPressed: () => {
          BlocProvider.of<NavigationBloc>(context)
              .add(NavigationPushName(route: page))
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
                Text(text, style: TextStyle(fontSize: 18.0, color: Colors.black54),)
              ],
            ),
          )
      ),
    );
  }
}
