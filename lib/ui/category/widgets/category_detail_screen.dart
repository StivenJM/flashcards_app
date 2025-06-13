import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/routes.dart';
import '../../core/localization/applocalization.dart';
import '../view_models/category_detail_viewmodel.dart';

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
      )..load(categoryId),
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
                    // Acción para agregar flashcard
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
                          onPressed: () => context.push(Routes.quiz(category.id)),
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
                        difficulty: 'N/A', // Si tienes dificultad, cámbialo aquí
                        question: flashcard.front,
                        answer: flashcard.back,
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
  final String difficulty;
  final String question;
  final String answer;

  const _FlashcardCard({
    required this.difficulty,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('[$difficulty]', style: const TextStyle(fontWeight: FontWeight.bold)),
                const Spacer(),
                IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
                IconButton(icon: const Icon(Icons.delete), onPressed: () {}),
              ],
            ),
            Text(question, style: const TextStyle(fontSize: 16)),
            const Divider(),
            Text(answer, style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}