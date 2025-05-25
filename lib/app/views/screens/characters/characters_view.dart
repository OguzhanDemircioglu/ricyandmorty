import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/views/screens/characters/characters_view_model.dart';

import '../../widgets/character_card_listview.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersViewModel>().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
          child: Column(
            children: [
              _searchInputWidget(context),
              Consumer<CharactersViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.charactersModel == null) {
                    return const CircularProgressIndicator.adaptive();
                  } else {
                    return CharacterCardListview(
                      characters: viewModel.charactersModel!.results,
                      loadMore: () => viewModel.getCharactersMore(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _searchInputWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 16),
    child: TextField(
      decoration: InputDecoration(
        labelText: 'Karakterlerde Ara',
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ),
    ),
  );
}
