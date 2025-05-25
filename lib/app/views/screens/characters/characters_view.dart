import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/views/screens/characters/characters_view_model.dart';

import 'character_card_list_view.dart';

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
    final viewModel = context.watch<CharactersViewModel>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
        child: Column(
          children: [
            _searchInputWidget(context, viewmodel: viewModel),
            viewModel.charactersModel == null
                ? const CircularProgressIndicator.adaptive()
                : CharacterCardListView(
                  characters: viewModel.charactersModel!.results,
                  loadMore: () => viewModel.getCharactersMore(),
                ),
          ],
        ),
      ),
    );
  }
}

Widget _searchInputWidget(
  BuildContext context, {
  required CharactersViewModel viewmodel,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 16),
    child: TextFormField(
      textInputAction: TextInputAction.search,
      onFieldSubmitted: viewmodel.getCharactersByName,
      decoration: InputDecoration(
        hintText: 'Karakterlerde Ara',
        hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
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
