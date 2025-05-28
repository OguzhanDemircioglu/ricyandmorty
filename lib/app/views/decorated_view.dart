import 'package:flutter/material.dart';

class DecoratedView extends StatelessWidget {
  final Widget child;
  const DecoratedView({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg-image.png'),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: child,
    );
  }
}
