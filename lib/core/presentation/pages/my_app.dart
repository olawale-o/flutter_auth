import 'package:flutter/material.dart';
import '../../theme/theme.dart';
import '../../../features/email_auth/presentation/bloc/auth_bloc.dart';
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
        BlocProvider<AuthBloc>(
            create: (context) => s1<AuthBloc>()
        ),
      ],
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus!.unfocus();
          }
        },
        child: MaterialApp(
          title: 'Flutter Auth',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          navigatorKey: s1<NavigationBloc>().navKey,
          initialRoute: initial_route,
          onGenerateRoute: GeneratedRoute.onGenerateRoute,
          // home: MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
