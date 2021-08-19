import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talk/features/authentication/application/authentication_facade.dart';

import 'package:talk/features/authentication/presentation/pages/home_page.dart';
import 'package:talk/features/authentication/presentation/pages/login_screen.dart';

class AuthRouter extends StatefulWidget {
  const AuthRouter({Key? key}) : super(key: key);

  @override
  _AuthRouterState createState() => _AuthRouterState();
}

class _AuthRouterState extends State<AuthRouter> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthenticationFacade(),
      child: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
