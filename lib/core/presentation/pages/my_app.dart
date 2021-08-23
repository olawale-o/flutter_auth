import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../navigation/navigation_bloc.dart';
import '../../../injection_container.dart';
import '../../routes/routes.dart';
import '../../routes/route.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
            create: (context) => s1<NavigationBloc>()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Auth',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        navigatorKey: s1<NavigationBloc>().navKey,
        initialRoute: initial_route,
        onGenerateRoute: GeneratedRoute.onGenerateRoute,
        // home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
