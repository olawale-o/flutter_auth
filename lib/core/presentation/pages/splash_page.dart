import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helper/auth_helper.dart';
import '../../navigation/navigation_bloc.dart';
import '../../routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthHelper _authHelper = AuthHelper();
  @override
  Widget build(BuildContext context) {
    if (_authHelper.user == null) {
      BlocProvider.of<NavigationBloc>(context)
          .add(NavigationPushName(route: login_page));
    } else {
      BlocProvider.of<NavigationBloc>(context)
          .add(NavigationPushName(route: dashboard_page));
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator()
        ),
      ),
    );
  }
}
