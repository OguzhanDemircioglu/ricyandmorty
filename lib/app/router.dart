import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:ricyandmorty/app/models/characters_model.dart';
import 'package:ricyandmorty/app/models/episode_model.dart';
import 'package:ricyandmorty/app/models/location_model.dart';
import 'package:ricyandmorty/app/views/screens/characterDetail/character_detail_view.dart';
import 'package:ricyandmorty/app/views/screens/characterDetail/character_detail_view_model.dart';
import 'package:ricyandmorty/app/views/screens/characters/characters_view.dart';
import 'package:ricyandmorty/app/views/screens/characters/characters_view_model.dart';
import 'package:ricyandmorty/app/views/screens/favorites/favorites_view.dart';
import 'package:ricyandmorty/app/views/screens/favorites/favorites_view_model.dart';
import 'package:ricyandmorty/app/views/screens/locations/locations_view.dart';
import 'package:ricyandmorty/app/views/screens/locations/locations_view_model.dart';
import 'package:ricyandmorty/app/views/screens/resident/resident_view.dart';
import 'package:ricyandmorty/app/views/screens/resident/resident_view_model.dart';
import 'package:ricyandmorty/app/views/screens/sectionCharacters/section_characters_view.dart';
import 'package:ricyandmorty/app/views/screens/sectionCharacters/section_characters_view_model.dart';
import 'package:ricyandmorty/app/views/screens/sections/sections_view.dart';
import 'package:ricyandmorty/app/views/screens/sections/sections_view_model.dart';
import 'package:ricyandmorty/app/views/screens/settings/settings_view.dart';
import 'package:ricyandmorty/app/views/screens/settings/settings_view_model.dart';
import 'package:ricyandmorty/app/views/screens/utils/app_view.dart';

final _routerKey = GlobalKey<NavigatorState>();
final _shellNavigatorCharactersKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellCharacters',
);
final _shellNavigatorFavouritesKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellFavourites',
);
final _shellNavigatorLocationsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellLocations',
);
final _shellNavigatorSectionsKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellSections',
);

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String favorites = '/favorites';
  static const String locations = '/locations';
  static const String sections = '/sections';
  static const String settings = '/settings';

  static const String characterDetail = 'characterDetail';
  static const String characterDetailRoute = '/characterDetail';

  static const String residentsRoute = 'residents';
  static const String residents = '/locations/residents';

  static const String sectionCharactersRoute = 'characters';
  static const String sectionCharacters = '/sections/characters';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.characters,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppView(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCharactersKey,
          routes: [
            GoRoute(
              path: AppRoutes.characters,
              builder:
                  (context, state) => ChangeNotifierProvider(
                    create: (context) => CharactersViewModel(),
                    child: const CharactersView(),
                  ),
              routes: [
                GoRoute(
                  path: AppRoutes.characterDetailRoute,
                  builder:
                      (context, state) => ChangeNotifierProvider(
                        create: (context) => CharacterDetailViewModel(),
                        child: CharacterDetailView(
                          character: state.extra as CharacterModel,
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorFavouritesKey,
          routes: [
            GoRoute(
              path: AppRoutes.favorites,
              builder:
                  (context, state) => ChangeNotifierProvider(
                    create: (context) => FavouritesViewmodel(),
                    child: const FavouritesView(),
                  ),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorLocationsKey,
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder:
                  (context, state) => ChangeNotifierProvider(
                    create: (context) => LocationViewmodel(),
                    child: const LocationsView(),
                  ),
              routes: [
                GoRoute(
                  path: AppRoutes.residentsRoute,
                  builder:
                      (context, state) => ChangeNotifierProvider(
                        create: (context) => ResidentViewModel(),
                        child: ResidentsView(
                          locationItem: state.extra as LocationItem,
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSectionsKey,
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder:
                  (context, state) => ChangeNotifierProvider(
                    create: (context) => SectionsViewmodel(),
                    child: const SectionsView(),
                  ),
              routes: [
                GoRoute(
                  path: AppRoutes.sectionCharactersRoute,
                  builder:
                      (context, state) => ChangeNotifierProvider(
                        create: (context) => SectionCharactersViewmodel(),
                        child: SectionCharactersView(
                          episodeModel: state.extra as EpisodeModel,
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.settings,
      builder:
          (context, state) => ChangeNotifierProvider(
            create: (context) => SettingsViewmodel(),
            child: const SettingsView(),
          ),
    ),
  ],
);
