import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: Scaffold(
        appBar: AppBar(
            title: Text('rİCKKY')),
        body: const Center(
            child: Text('Hidasfa')),
      ),
    );
  }
}
