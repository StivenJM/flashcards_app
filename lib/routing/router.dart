import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import 'routes.dart';

import '../ui/settings/view_models/settings_viewmodel.dart';
import '../ui/statistics/view_models/statistics_viewmodel.dart';
import '../ui/settings/widgets/settings_screen.dart';
import '../ui/statistics/widgets/statistics_screen.dart';

/// Top go_router entry point.
GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        final viewModel = HomeViewModel(categoryRepository: context.read());
        return HomeScreen(viewModel: viewModel);
      },
      routes: [],
    ),
    GoRoute(path: '/settings', builder: (context, state) => SettingsScreen()),
    GoRoute(
      path: '/statistics',
      builder: (context, state) => const StatisticsScreen(),
    ),
  ],
);
