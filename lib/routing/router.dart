import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/core/ui/navigation_scaffold.dart';
import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import '../ui/study/view_models/study_viewmodel.dart';
import '../ui/study/widgets/study_screen.dart';
import '../ui/not_found/widgets/not_found_screen.dart';
import 'routes.dart';

/// Top go_router entry point.
GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return NavigationScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) {
            final viewModel = HomeViewModel(
              categoryRepository: context.read()
            );
            return NoTransitionPage(
              child: HomeScreen(viewModel: viewModel),
            );
          },
        ),
        GoRoute(
          path: Routes.study,
          pageBuilder: (context, state) {
            final viewModel = StudyViewModel(
              categoryRepository: context.read(),
            );
            return NoTransitionPage(
              child: StudyScreen(viewModel: viewModel),
            );
          },
        ),
      ]
    ),
  ],

  // Not found route
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: const NotFoundScreen(), // Puedes crear esta pantalla
  ),
);
