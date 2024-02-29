
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myproo/auth/main_auth.dart';
import 'package:myproo/presentation/main_page.dart';

import 'presentation/login_page.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainAuth(),
    );
  }
}