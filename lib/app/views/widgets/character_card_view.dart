import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';

class CharacterCardView extends StatelessWidget {
  final Character character;

  const CharacterCardView({super.key, required this.character});

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
                  child: Image.network(character.image),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 17,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5),
                      _infoWidget(
                        type: 'Köken',
                        value: character.location.name,
                      ),
                      SizedBox(height: 5),
                      _infoWidget(
                        type: 'Durum',
                        value: '${character.status} - ${character.type}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
        ],
      ),
    );
  }

  Widget _infoWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(type, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w300)),
        Text(value, style: TextStyle(fontWeight: FontWeight.w300)),
      ],
    );
  }
}
