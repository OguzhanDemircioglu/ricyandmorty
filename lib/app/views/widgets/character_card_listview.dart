import 'dart:developer';

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
    _detectScrollBottom();
    super.initState();
  }

  void _detectScrollBottom() {
    _scroolController.addListener(() {
      final maxScroll = _scroolController.position.maxScrollExtent;
      final currentPosition = _scroolController.position.pixels;
      const int delta = 200;

      if (maxScroll - currentPosition <= delta) {
        log("alta gel");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: widget.characters.length,
        itemBuilder: (context, index) {
          final character = widget.characters[index];
          return CharacterCardView(character: character);
        },
      ),
    );
  }
}
