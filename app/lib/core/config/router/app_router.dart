import 'package:go_router/go_router.dart';

import 'package:flutter_application/features/character_list/presentation/presentation.dart';
import 'not_found_page.dart';

enum AppRoute {
  home,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: AppRoute.home.name,
      path: '/',
      builder: (context, state) => const CharactersListPage(),
    ),
  ],
  errorBuilder: (context, state) => const NotFoundPage(),
);
