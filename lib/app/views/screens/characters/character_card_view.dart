import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';
import 'package:ricyandmorty/app/services/preferences_service.dart';

import '../../../locator.dart';

class CharacterCardView extends StatefulWidget {
  final Character character;
  final bool isFavorite;

  const CharacterCardView({
    super.key,
    required this.character,
    this.isFavorite = false,
  });

  @override
  State<CharacterCardView> createState() => _CharacterCardViewState();
}

class _CharacterCardViewState extends State<CharacterCardView> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _favoriteCharacter() {
    setState(() {
      _isFavorite = !_isFavorite;

      if (_isFavorite) {
        locator<PreferencesService>().saveCharacter(widget.character.id);
      } else {
        locator<PreferencesService>().deleteCharacter(widget.character.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 9),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.network(widget.character.image),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 17,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.character.name,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        _infoWidget(
                          type: 'Köken',
                          value: widget.character.location.name,
                        ),
                        SizedBox(height: 5),
                        _infoWidget(
                          type: 'Durum',
                          value:
                              '${widget.character.status} - ${widget.character.type}',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: _favoriteCharacter,
            icon: Icon(_isFavorite ? Icons.bookmark : Icons.bookmark_border),
          ),
        ],
      ),
    );
  }

  Widget _infoWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300)),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
