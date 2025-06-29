import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/locator.dart';
import 'package:ricyandmorty/app/router.dart';
import 'package:ricyandmorty/app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  final appTheme = AppTheme();
  await appTheme.loadTheme();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => appTheme)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder:
          (context, viewModel, child) => MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: viewModel.theme,
          ),
    );
  }
}
