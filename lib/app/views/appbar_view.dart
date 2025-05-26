import 'package:flutter/material.dart';

class AppbarView extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool transparentBackground;

  const AppbarView({
    super.key,
    required this.title,
    this.transparentBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparentBackground ? Colors.transparent : null,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings))],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
