import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/core/ui/navigation_scaffold.dart';
import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import '../ui/study/view_models/study_viewmodel.dart';
import '../ui/study/widgets/study_screen.dart';
import '../ui/not_found/widgets/not_found_screen.dart';
import '../ui/category/widgets/category_detail_screen.dart';
import 'routes.dart';

import '../ui/settings/widgets/settings_screen.dart';
import '../ui/statistics/view_models/statistics_viewmodel.dart';
import '../ui/statistics/widgets/statistics_screen.dart';

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
        GoRoute(
          path: '/settings', 
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: SettingsScreen()
            );
          }
        ),
        GoRoute(
          path: Routes.statistics,

          pageBuilder: (context, state) {
            final viewModel = StatisticsViewModel(
              repository: context.read()
            );
            return NoTransitionPage(
              child: StatisticsScreen(viewModel: viewModel)
            );
          },
        ),
      ]
    ),
    GoRoute(
      path: Routes.viewCategory(':categoryId'),
      pageBuilder: (context, state) {
        final categoryId = state.pathParameters['categoryId']!;
        return MaterialPage(
          child: CategoryDetailScreen(categoryId: categoryId),
        );
      },
    ),
  ],

  // Not found route
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: const NotFoundScreen(), // Puedes crear esta pantalla
  ),
);
