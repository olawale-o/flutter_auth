import 'package:flutter/material.dart';
import '../../../features/email_auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_auth/injection_container.dart';
import '../../navigation/navigation_bloc.dart';
import '../../routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  final String data;
  const DashboardPage({Key? key, required this.data}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard page'),
        actions: [
          IconButton(onPressed: ()  {
            s1<AuthBloc>().add(AuthLogoutEvent());
            BlocProvider.of<NavigationBloc>(context)
                .add(NavigationHome());
          }, icon: Icon(Icons.home))
        ],
      ),
      body: Center(
        child: Text('Logged in as ${widget.data}'),
      ),
    );
  }
}
