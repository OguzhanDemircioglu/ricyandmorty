import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/views/screens/utils/appbar_view.dart';

import '../../../theme.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarView(title: 'Ayarlar', hideSettings: true),
      body: Center(
        child: ListView(
          children: [
            ListTile(
              title: const Text('Karanlık Tema'),
              trailing: Switch(
                value: context.watch<AppTheme>().themeMode == ThemeMode.dark,
                onChanged: (v) => context.read<AppTheme>().toggleTheme(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
