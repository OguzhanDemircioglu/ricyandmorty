import 'package:flutter/material.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';

import '../../appbar_view.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;

  const CharacterDetail({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppbarView(
          title: 'Character Detail',
          transparentBackground: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg-image.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _characterAvatar(context),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 13),
                      Text(
                        character.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _skilView(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _skilView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 39),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          _skill(context, character.status),
          _skill(context, character.origin.name),
          _skill(context, character.gender),
          _skill(context, character.species),
        ],
      ),
    );
  }

  Container _skill(BuildContext context, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(label, style: TextStyle(fontSize: 12)),
    );
  }

  Padding _characterAvatar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 60, bottom: 52),
      child: CircleAvatar(
        radius: 105,
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: CircleAvatar(
          radius: 100,
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: CircleAvatar(
            backgroundImage: NetworkImage(character.image),
            radius: 95,
          ),
        ),
      ),
    );
  }
}
