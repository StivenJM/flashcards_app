import 'package:flashcards_app/domain/models/flashcard/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/routes.dart';
import '../../core/localization/applocalization.dart';
import '../view_models/category_detail_viewmodel.dart';
import 'flashcard_form_dialog.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String categoryId;
  const CategoryDetailScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ChangeNotifierProvider(
      create: (context) => CategoryDetailViewModel(
        categoryRepository: context.read(),
        flashcardRepository: context.read(),
        categoryId: categoryId
      ),
      child: Consumer<CategoryDetailViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.category == null) {
            return const Center(child: Text('Categoría no encontrada'));
          }
          final category = vm.category!;
          final flashcards = vm.flashcards;

          return Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: Text(category.name),
              actions: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => FlashcardFormDialog(categoryId: category.id),
                    );
                  },
                ),
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Descripción y cantidad de flashcards
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category.description, style: const TextStyle(fontSize: 16)),
                      Text('${flashcards.length} flashcards', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                // Botones de modos
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
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
                          onPressed: () => context.push(Routes.quizCategory(category.id)),
                          icon: const Icon(Icons.play_arrow),
                          label: Text(AppLocalization.of(context).quiz, style: theme.textTheme.bodyMedium),
                          style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.onPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Lista de flashcards
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: flashcards.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final flashcard = flashcards[index];
                      return _FlashcardCard(
                        flashcard: flashcard
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _FlashcardCard extends StatelessWidget {
  final Flashcard flashcard;

  const _FlashcardCard({
    required this.flashcard,
  });

  @override
  Widget build(BuildContext context) {
    String difficultyLabel;
    switch (flashcard.difficulty) {
      case 0:
        difficultyLabel = 'EASY';
        break;
      case 1:
        difficultyLabel = 'MEDIUM';
        break;
      case 2:
        difficultyLabel = 'HARD';
        break;
      default:
        difficultyLabel = 'N/A';
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(difficultyLabel, style: const TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.edit), 
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => FlashcardFormDialog(
                        initialFlashcard: flashcard,
                        categoryId: flashcard.categoryId,
                      ),
                    );
                  }
                ),
                IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
              ],
            ),
            Text(flashcard.front, style: const TextStyle(fontSize: 16)),
            const Divider(),
            Text(flashcard.back, style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}