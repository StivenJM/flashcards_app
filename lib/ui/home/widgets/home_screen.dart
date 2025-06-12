import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/models/category/category.dart';
import '../../../routing/routes.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/error_indicator.dart';
import '../view_models/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});
  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.load.execute();
    widget.viewModel.deleteCategory.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.deleteCategory.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.deleteCategory.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Category deleted")),
      );
    }
    if (widget.viewModel.deleteCategory.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error deleting category")),
      );
    }
    widget.viewModel.deleteCategory.clearResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flashcard Study")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(Routes.newCategory),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const _BottomNavigationBar(),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, child) {
            if (widget.viewModel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }
            if (widget.viewModel.load.error) {
              return ErrorIndicator(
                title: "Error loading categories",
                label: "Try again",
                onPressed: widget.viewModel.load.execute,
              );
            }
            return _CategoryList(viewModel: widget.viewModel);
          },
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({required this.viewModel});
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      itemCount: viewModel.categories.length,
      padding: const EdgeInsets.all(12),
      itemBuilder: (_, index) {
        final category = viewModel.categories[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: theme.colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(category.name, style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.onPrimary)),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: theme.colorScheme.secondary),
                      onPressed: () => context.push(Routes.editCategory(category.id)),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: theme.colorScheme.onError),
                      onPressed: () => viewModel.deleteCategory.execute(category.id),
                    ),
                  ],
                ),
                Text(category.description, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: theme.colorScheme.secondary)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => context.push(Routes.study(category.id)),
                        icon: const Icon(Icons.book),
                        label: const Text("Study"),
                        style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.onPrimary),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => context.push(Routes.quiz(category.id)),
                        icon: const Icon(Icons.play_arrow),
                        label: const Text("Quiz"),
                        style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.onPrimary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      indicatorColor: Theme.of(context).colorScheme.onSurface,
      selectedIndex: 0,
      onDestinationSelected: (int index) {
        // Puedes definir rutas específicas aquí
      },
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
        NavigationDestination(icon: Icon(Icons.book), label: 'Study'),
        NavigationDestination(icon: Icon(Icons.bar_chart), label: 'Statistics'),
        NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
      ],
    );
  }
}
