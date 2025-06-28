import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/views/screens/favorites/favorites_view_model.dart';

import '../../appbar_view.dart';
import '../characters/character_card_list_view.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  void initState() {
    super.initState();
    context.read<FavouritesViewmodel>().getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavouritesViewmodel>();
    return Scaffold(
      appBar: const AppbarView(title: 'Favorilerim'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
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
