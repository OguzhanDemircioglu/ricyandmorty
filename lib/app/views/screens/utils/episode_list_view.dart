import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ricyandmorty/app/models/episode_model.dart';
import 'package:ricyandmorty/app/router.dart';

class EpisodeListView extends StatefulWidget {
  final List<EpisodeModel> episodes;
  final bool loadMore;
  final VoidCallback? onLoadMore;
  const EpisodeListView({
    super.key,
    required this.episodes,
    this.loadMore = false,
    this.onLoadMore,
  });

  @override
  State<EpisodeListView> createState() => _EpisodeListViewState();
}

class _EpisodeListViewState extends State<EpisodeListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _listenScroll();
  }

  void _listenScroll() {
    _scrollController.addListener(() {
      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      final delta = 200;

      if (maxScroll - currentPosition <= delta) {
        widget.onLoadMore?.call();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final EpisodeModel model = widget.episodes[index];
        return Column(
          children: [
            ListTile(
              onTap:
                  () => context.push(AppRoutes.sectionCharacters, extra: model),
              leading: const Icon(Icons.face_retouching_natural_rounded),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: Text(
                model.episode,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(model.name, style: TextStyle(fontSize: 12)),
            ),
            if (widget.loadMore && index == widget.episodes.length - 1)
              const CircularProgressIndicator.adaptive(),
          ],
        );
      },
      separatorBuilder:
          (context, index) => Divider(
            color: Theme.of(context).colorScheme.tertiary,
            indent: 30,
            endIndent: 30,
          ),
      itemCount: widget.episodes.length,
    );
  }
}
