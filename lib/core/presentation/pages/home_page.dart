import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../navigation/navigation_bloc.dart';
import '../../routes/routes.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
            future: _initialize,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Error ${snapshot.error}'),);
              }
              if (snapshot.connectionState == ConnectionState.done) {
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigationPushName(route: splash_page));
              }
              return Center(child: CircularProgressIndicator(),);
            }
        ),
    );
  }
}
