import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/models/episode_model.dart';
import 'package:ricyandmorty/app/views/screens/characters/character_card_list_view.dart';
import 'package:ricyandmorty/app/views/screens/sectionCharacters/section_characters_view_model.dart';

import '../utils/appbar_view.dart';

class SectionCharactersView extends StatefulWidget {
  final EpisodeModel episodeModel;
  const SectionCharactersView({super.key, required this.episodeModel});

  @override
  State<SectionCharactersView> createState() => _SectionCharactersViewState();
}

class _SectionCharactersViewState extends State<SectionCharactersView> {
  @override
  void initState() {
    super.initState();
    context.read<SectionCharactersViewmodel>().getCharacters(
      widget.episodeModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarView(title: widget.episodeModel.episode),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Consumer<SectionCharactersViewmodel>(
              builder: (context, viewModel, child) {
                return CharacterCardListView(characters: viewModel.characters);
              },
            ),
          ],
        ),
      ),
    );
  }
}
