import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../features/email_auth/presentation/bloc/auth_bloc.dart';
import '../../navigation/navigation_bloc.dart';
import '../../routes/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthInitial || (state is AuthLoaded && state.userModel.user == null)) {
          BlocProvider.of<NavigationBloc>(context)
              .add(NavigationPushName(route: login_page));
        } else {
          BlocProvider.of<NavigationBloc>(context)
              .add(NavigationPushName(route: dashboard_page));
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Center(
                child: Text('Splash screen $state'),
              );
            },
          )
        ),
      ),
    );
  }
}
