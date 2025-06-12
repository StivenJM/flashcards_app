import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routing/routes.dart';
import '../view_models/study_viewmodel.dart';
import '../../core/localization/applocalization.dart';

class CategoryPanel extends StatelessWidget {
  const CategoryPanel({super.key, required this.viewModel});
  final StudyViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            AppLocalization.of(context).categories,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: _CategoryList(viewModel: viewModel)),
      ],
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({required this.viewModel});
  final StudyViewModel viewModel;

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
                      child: Text(category.name, style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onPrimary)),
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
        );
      },
    );
  }
}
