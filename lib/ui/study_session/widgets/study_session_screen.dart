import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/flashcard/flashcard.dart';
import '../view_models/study_session_viewmodel.dart';

class StudySessionScreen extends StatelessWidget {
  final String categoryId;
  const StudySessionScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudySessionViewModel(
        categoryRepository: context.read(),
        flashcardRepository: context.read(),
        categoryId: categoryId,
      ),
      child: Consumer<StudySessionViewModel>(
        builder: (context, vm, _) {
          if (vm.category == null || vm.flashcards.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          final flashcard = vm.currentFlashcard;
          if (flashcard == null) {
            return Center(
              child: Text(
                "No flashcards to study in this category.",
                textAlign: TextAlign.center,
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: Text('${vm.category?.name ?? "Study"}'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '${vm.category?.name ?? ""} - Study',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Card ${vm.currentIndex + 1} of ${vm.flashcards.length}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(value: vm.progress),
                  const SizedBox(height: 24),
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          Text(
                            'QUESTION',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            flashcard.front,
                            style: const TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: vm.showAnswer
                        ? Card(
                            key: const ValueKey('answer'),
                            color: Colors.green[50],
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(
                                    'ANSWER',
                                    style: Theme.of(context).textTheme.labelLarge,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    flashcard.back,
                                    style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onPrimary),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : SizedBox(
                            key: const ValueKey('hidden'),
                            height: 80,
                            child: Center(
                              child: Text(
                                'Tap "Show Answer" to reveal',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: vm.showAnswerToggle,
                    child: Text(vm.showAnswer ? 'Hide Answer' : 'Show Answer'),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: vm.currentIndex > 0 ? vm.previousCard : null,
                        tooltip: 'Previous',
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: vm.currentIndex < vm.flashcards.length - 1
                            ? vm.nextCard
                            : null,
                        tooltip: 'Next',
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}