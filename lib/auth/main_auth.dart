import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproo/auth/auth.dart';
import 'package:myproo/presentation/login_setpin_page.dart';
import 'package:myproo/utils/navigation.dart';

class MainAuth extends StatelessWidget {
  const MainAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return EnterMPinPageView();
          } else {
            return AuthPage();
          }
        },
      ),
    );
  }
}