import 'package:flutter/material.dart';
import 'package:dog_source/screen/login/LoginPage.dart';
import 'package:dog_source/layout/LayoutData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Source',
      debugShowCheckedModeBanner: false,
      theme: LayoutData().getLayout(),
      home: LoginPage(),
    );
  }
}
