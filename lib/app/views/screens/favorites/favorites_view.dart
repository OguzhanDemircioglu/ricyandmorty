import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/views/screens/favorites/favorites_view_model.dart';

import '../../appbar_view.dart';
import '../characters/character_card_list_view.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesViewModel>().getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoritesViewModel>();
    return Scaffold(
      appBar: AppbarView(title: 'Favorilerim'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child:
              viewModel.characters.isEmpty
                  ? const CircularProgressIndicator.adaptive()
                  : Column(
                    children: [
                      CharacterCardListView(characters: viewModel.characters),
                    ],
                  ),
        ),
      ),
    );
  }
}
