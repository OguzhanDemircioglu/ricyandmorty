import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/theme.dart';
import 'package:ricyandmorty/views/app_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: AppView(),
    );
  }
}
