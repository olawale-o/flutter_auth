import 'package:flutter/material.dart';
import 'package:flutter_auth/core/helper/auth_helper.dart';
import 'package:flutter_auth/core/navigation/navigation_bloc.dart';
import 'package:flutter_auth/core/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  AuthHelper _authHelper = AuthHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard page'),
        actions: [
          IconButton(onPressed: () async {
            await _authHelper.logOut();
            BlocProvider.of<NavigationBloc>(context)
                .add(NavigationPushName(route: login_page));
          }, icon: Icon(Icons.home))
        ],
      ),
      body: Center(
        child: Text('Logged in as'),
      ),
    );
  }
}
