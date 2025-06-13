import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../../core/ui/error_indicator.dart';
import '../view_models/home_viewmodel.dart';
import '../../core/localization/applocalization.dart';
import 'category_form_dialog.dart';

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
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => CategoryFormDialog(),
          );
        },
        child: const Icon(Icons.add),
      ),
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
        return InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => context.push(Routes.viewCategory(category.id)),
          child: Card(
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
                        child: Text(category.name, style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimary)),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit, color: theme.colorScheme.secondary),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => CategoryFormDialog(initialCategory: category),
                          );
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete, color: theme.colorScheme.onError),
                        onPressed: () => viewModel.deleteCategory.execute(category.id),
                      ),
                    ],
                  ),
                  Text(category.description, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.secondary)),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => context.push(Routes.studyCategory(category.id)),
                          icon: const Icon(Icons.book),
                          label: Text(AppLocalization.of(context).studyNow, style: theme.textTheme.bodyMedium),
                          style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.onPrimary),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => context.push(Routes.quiz(category.id)),
                          icon: const Icon(Icons.play_arrow),
                          label: Text(AppLocalization.of(context).quiz, style: theme.textTheme.bodyMedium),
                          style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.onPrimary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
