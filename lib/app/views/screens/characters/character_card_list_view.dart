import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/locator.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';
import 'package:ricyandmorty/app/services/preferences_service.dart';

import 'character_card_view.dart';

class CharacterCardListView extends StatefulWidget {
  final List<Character> characters;
  final VoidCallback? loadMore;

  const CharacterCardListView({
    super.key,
    required this.characters,
    this.loadMore,
  });

  @override
  State<CharacterCardListView> createState() => _CharacterCardListViewState();
}

class _CharacterCardListViewState extends State<CharacterCardListView> {
  final _scrollController = ScrollController();
  List<int> _favoriteList = [];
  bool loader = true;
  bool isPaginationLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _getFavorites();
  }

  void _onScroll() {
    if (widget.loadMore != null && !isPaginationLoading) {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentScroll = _scrollController.position.pixels;
      const delta = 200;

      if (maxScroll - currentScroll <= delta) {
        setState(() {
          isPaginationLoading = true;
        });
        widget.loadMore!();
      }
    }
  }

  void _closeLoader() {
    setState(() {
      loader = false;
    });
  }

  void stopPaginationLoader() {
    setState(() {
      isPaginationLoading = false;
    });
  }

  void _getFavorites() async {
    _favoriteList = locator<PreferencesService>().getCharactersFromCache();
    _closeLoader();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (loader) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.characters.length + (isPaginationLoading ? 1 : 0),
        itemBuilder: (context, index) {
          if (index == widget.characters.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Center(child: CircularProgressIndicator.adaptive()),
            );
          }

          final character = widget.characters[index];
          final bool isFavorite = _favoriteList.contains(character.id);
          return CharacterCardView(
            character: character,
            isFavorite: isFavorite,
          );
        },
      ),
    );
  }
}
