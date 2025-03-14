import 'package:flutter/material.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
          child: Column(
            children: [
              _searchInputWidget(context),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        'https://m.media-amazon.com/images/M/MV5BN2U2YzU1ZjYtZjAyZS00MjhhLTliMzctMmRjMjI2MjdjNzEyXkEyXkFqcGc@._V1_.jpg',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

@override
Widget _searchInputWidget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 16),
    child: TextField(
      decoration: InputDecoration(
        labelText: 'Karakterlerde Ara',
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ),
    ),
  );
}
