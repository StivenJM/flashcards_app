import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../localization/applocalization.dart';

class NavigationScaffold extends StatelessWidget {
  const NavigationScaffold({super.key, required this.child});
  final Widget child;

  static const List<String> _tabs = [
    '/home',
    '/study',
    '/stats',
    '/settings',
  ];

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final selectedIndex = _tabs.indexWhere((tab) => currentLocation.startsWith(tab));

    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex < 0 ? 0 : selectedIndex,
        onDestinationSelected: (index) => context.go(_tabs[index]),
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: AppLocalization.of(context).homeTitle),
          NavigationDestination(icon: Icon(Icons.book), label: AppLocalization.of(context).studyTitle),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: AppLocalization.of(context).statisticsTitle),
          NavigationDestination(icon: Icon(Icons.settings), label: AppLocalization.of(context).settingsTitle),
        ],
      ),
    );
  }
}
