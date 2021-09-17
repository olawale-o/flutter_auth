import 'package:flutter/material.dart';
import '../../../features/email_auth/presentation/bloc/auth_bloc.dart';
import '../../navigation/navigation_bloc.dart';
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
            BlocProvider.of<AuthBloc>(context).add(AuthLogoutEvent());
            BlocProvider.of<NavigationBloc>(context)
                .add(NavigationHome());
          }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Text('Logged in as ${widget.data}'),
      ),
    );
  }
}
