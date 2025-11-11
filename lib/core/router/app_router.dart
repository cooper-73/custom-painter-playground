import 'package:custom_painter_playground/core/core.dart';
import 'package:custom_painter_playground/presentation/presentation.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const explore = '/explore';
  static const playground = '/playground/:${AppPathParameters.patternId}';
  static const favorites = '/favorites';
  static const settings = '/settings';

  static String playgroundPath(String patternId) => '/playground/$patternId';
}

abstract class AppPathParameters {
  static const patternId = 'patternId';
}

final appRouter = GoRouter(
  initialLocation: AppRoutes.explore,
  routes: [
    ShellRoute(
      builder: (context, state, child) => NestedNavigationScaffold(body: child),
      routes: [
        GoRoute(
          path: AppRoutes.explore,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: ExplorePage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.favorites,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: FavoritesPage(),
          ),
        ),
        GoRoute(
          path: AppRoutes.settings,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SettingsPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      path: AppRoutes.playground,
      builder: (context, state) {
        final patternId = state.pathParameters[AppPathParameters.patternId] ?? '';
        final patternKind = PatternKindX.fromString(patternId); // TODO: Handle ArgumentError

        return PlaygroundPage(patternKind: patternKind);
      },
    ),
  ],
);
