import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/email_auth/presentation/forms/signup_form.dart';
import '../../features/email_auth/presentation/forms/login_form.dart';
import '../../features/email_auth/presentation/pages/signup_page.dart';
import 'routes.dart';
import '../presentation/pages/dashboard_page.dart';
import '../presentation/pages/home_page.dart';
import '../presentation/pages/splash_page.dart';
import '../../../features/email_auth/presentation/pages/login_page.dart';

class GeneratedRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch(routeSettings.name) {
      case login_form:
        return MaterialPageRoute(builder: (_) => LoginForm());
      case dashboard_page:
        return MaterialPageRoute(builder: (_) => DashboardPage(data: args.toString(),));
      case home_page:
        return MaterialPageRoute(builder: (_) => Homepage());
      case splash_page:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case login_page:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case signup_page:
        return MaterialPageRoute(builder: (_) => SignupPage());
      case signup_form:
        return MaterialPageRoute(builder: (_) => SignupForm());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar: AppBar(
        title: Text("Error"),
      ),
      body: Center(
        child: Text("Not found"),
      ),
    ));
  }
}