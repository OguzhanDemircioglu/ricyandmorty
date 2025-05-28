import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';
import 'package:ricyandmorty/app/views/screens/characterDetail/character_detail_view_model.dart';

import '../../../models/episode_model.dart';
import '../../appbar_view.dart';
import '../../decorated_view.dart';

class CharacterDetailView extends StatefulWidget {
  final Character character;

  const CharacterDetailView({super.key, required this.character});

  @override
  State<CharacterDetailView> createState() => _CharacterDetailView();
}

class _CharacterDetailView extends State<CharacterDetailView> {
  @override
  void initState() {
    super.initState();
    context.read<CharacterDetailViewModel>().getEpisodes(
      widget.character.episode,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppbarView(
          title: 'Character Detail',
          transparentBackground: true,
        ),
        body: DecoratedView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [_characterAvatar(context), _characterContent(context)],
          ),
        ),
      ),
    );
  }

  Expanded _characterContent(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 13),
            Text(
              widget.character.name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            _skilView(context),
            const SizedBox(height: 15),
            _scenesTitle(),
            const SizedBox(height: 15),
            _episodeTitles(),
          ],
        ),
      ),
    );
  }

  Flexible _episodeTitles() {
    return Flexible(
      child: Consumer<CharacterDetailViewModel>(
        builder: (context, viewModel, child) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final EpisodeModel model = viewModel.episodes[index];
              return ListTile(
                leading: const Icon(Icons.face_retouching_natural_rounded),
                trailing: const Icon(Icons.arrow_forward_ios),
                title: Text(
                  model.episode,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(model.name, style: TextStyle(fontSize: 12)),
              );
            },
            separatorBuilder:
                (context, index) => Divider(
                  color: Theme.of(context).colorScheme.tertiary,
                  indent: 30,
                  endIndent: 30,
                ),
            itemCount: viewModel.episodes.length,
          );
        },
      ),
    );
  }

  Container _scenesTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        'Episodes ${widget.character.episode.length}',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    );
  }

  Padding _skilView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          _skill(context, widget.character.status),
          _skill(context, widget.character.origin.name),
          _skill(context, widget.character.gender),
          _skill(context, widget.character.species),
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
          child: Hero(
            tag: widget.character.image,
            child: CircleAvatar(
              backgroundImage: NetworkImage(widget.character.image),
              radius: 95,
            ),
          ),
        ),
      ),
    );
  }
}
