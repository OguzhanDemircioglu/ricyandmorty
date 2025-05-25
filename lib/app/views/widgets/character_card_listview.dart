import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';

import 'character_card_view.dart';

class CharacterCardListview extends StatefulWidget {
  final List<Character> characters;
  final VoidCallback loadMore;

  const CharacterCardListview({
    super.key,
    required this.characters,
    required this.loadMore,
  });

  @override
  State<CharacterCardListview> createState() => _CharacterCardListviewState();
}

class _CharacterCardListviewState extends State<CharacterCardListview> {
  final _scroolController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scroolController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scroolController.position.maxScrollExtent;
    final currentScroll = _scroolController.position.pixels;
    const delta = 200;

    if (maxScroll - currentScroll <= delta) {
      widget.loadMore();
    }
  }

  @override
  void dispose() {
    _scroolController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scroolController,
        itemCount: widget.characters.length,
        itemBuilder: (context, index) {
          final character = widget.characters[index];
          return Column(
            children: [
              CharacterCardView(character: character),
              if (index == widget.characters.length - 1)
                const CircularProgressIndicator.adaptive(),
            ],
          );
        },
      ),
    );
  }
}
