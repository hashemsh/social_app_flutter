import 'package:flutter/material.dart';
import 'package:social_app_flutter/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'social App flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        primarySwatch: Theme.of(context).primaryColor,
      ),
      home: LoginScreen(),
    );
  }
}
