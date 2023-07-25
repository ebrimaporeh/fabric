import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home_page.dart';
import 'package:fabric_app/pages/login_page.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged on
          if (snapshot.hasData) {
            return HomePage();
          }


          // user is NOT logged on
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
