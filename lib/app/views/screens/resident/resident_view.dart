import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/models/location_model.dart';
import 'package:ricyandmorty/app/views/screens/characters/character_card_list_view.dart';
import 'package:ricyandmorty/app/views/screens/resident/resident_view_model.dart';
import 'package:ricyandmorty/app/views/screens/utils/appbar_view.dart';

class ResidentsView extends StatefulWidget {
  final LocationItem locationItem;
  const ResidentsView({super.key, required this.locationItem});

  @override
  State<ResidentsView> createState() => _ResidentsViewState();
}

class _ResidentsViewState extends State<ResidentsView> {
  @override
  void initState() {
    super.initState();
    context.read<ResidentViewModel>().getResidents(
      widget.locationItem.residents,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarView(title: widget.locationItem.name),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Consumer<ResidentViewModel>(
              builder: (context, viewModel, child) {
                return CharacterCardListView(characters: viewModel.residents);
              },
            ),
          ],
        ),
      ),
    );
  }
}
