import 'package:flutter/material.dart';
import 'package:talk/features/authentication/presentation/pages/auth_router.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebase_core.Firebase.initializeApp();

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talk',
      theme: ThemeData(),
      home: AuthRouter(),
    );
  }
}
