import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.face_2_outlined),
            icon: Icon(Icons.face),
            label: 'Karakterler',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.face_2_outlined),
            icon: Icon(Icons.bookmark),
            label: 'Favorilerim',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.face),
            icon: Icon(Icons.location_on),
            label: 'Konumlar',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.face),
            icon: Icon(Icons.menu),
            label: 'Menü',
          ),
        ],
      ),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      title: const Text(
        'Rick and Morty',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
    );
  }
}
