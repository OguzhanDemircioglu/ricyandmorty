import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/views/app_view.dart';
import 'package:ricyandmorty/app/views/screens/characters/characters_view.dart';
import 'package:ricyandmorty/app/views/screens/characters/characters_view_model.dart';
import 'package:ricyandmorty/app/views/screens/favorites/favorites_view.dart';
import 'package:ricyandmorty/app/views/screens/locations/locations_view.dart';
import 'package:ricyandmorty/app/views/screens/sections/sections_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String favorites = '/favorites';
  static const String locations = '/locations';
  static const String sections = '/sections';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.characters,
  routes: [
    StatefulShellRoute.indexedStack(
      builder:
          (context, state, navigationShell) =>
              AppView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.characters,
              builder:
                  (context, state) => ChangeNotifierProvider(
                    create: (context) => CharactersViewModel(),
                    child: const CharactersView(),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder: (context, state) => const FavoritesView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder: (context, state) => const LocationsView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder: (context, state) => const SectionsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
