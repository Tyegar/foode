import 'package:flutter/material.dart';
import 'package:foode/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'auth/login_or_register.dart';
import 'page/login_page.dart';
import 'page/register_page.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      // theme provider
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      // restuarant provider
      ChangeNotifierProvider(create: (context) => Restaurant()),
    ],
    child: const MyApp(),
    ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
