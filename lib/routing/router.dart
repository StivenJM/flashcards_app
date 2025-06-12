import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../ui/home/view_models/home_viewmodel.dart';
import '../ui/home/widgets/home_screen.dart';
import 'routes.dart';

/// Top go_router entry point.
GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        final viewModel = HomeViewModel(
          categoryRepository: context.read()
        );
        return HomeScreen(viewModel: viewModel);
      },
      routes: [],
    ),
  ],
);
