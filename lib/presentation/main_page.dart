
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myproo/presentation/login_page.dart';
import 'package:myproo/presentation/signup_page.dart';

import 'home_page.dart';

// class MainPage extends StatelessWidget {
//   const MainPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return Home_Page();
//         } else {
//           return Signup();
//         }
//       },
//     );
//   }
// }