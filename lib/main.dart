import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ui/authentication/register_page.dart';
import 'ui/authentication/login_page.dart';
import 'ui/welcome_page.dart';
import 'ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff2b2b2b),
        appBarTheme: const AppBarTheme(
          color: Color(0xff2b2b2b),
        ),
      ),
      home: const SafeArea(
        child: WelcomePage(),
      ),
    );
  }
}
