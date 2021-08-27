import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/presentation/pages/my_app.dart';
import 'injection_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}
