import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/views/decorated_view.dart';

class LocationsView extends StatelessWidget {
  const LocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: DecoratedView(child: Column()),
      ),
    );
  }
}
