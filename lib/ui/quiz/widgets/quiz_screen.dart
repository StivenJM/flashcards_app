import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/flashcard/flashcard.dart';
import '../../core/localization/applocalization.dart';
import '../view_models/quiz_viewmodel.dart';

class QuizScreen extends StatelessWidget {
  final QuizViewModel viewModel;
  const QuizScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        if (viewModel.category == null || viewModel.flashcards.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        final flashcard = viewModel.currentFlashcard;
        if (flashcard == null) {
          return Center(
            child: Text(
              "Quiz finished!\nScore: ${viewModel.correct} Correct | ${viewModel.incorrect} Incorrect",
              textAlign: TextAlign.center,
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: Text('${viewModel.category?.name ?? "Quiz"}'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '${viewModel.category?.name ?? ""} QUIZ',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Question ${viewModel.currentIndex + 1} of ${viewModel.flashcards.length}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(value: viewModel.progress),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'QUESTION:\n${flashcard.front}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      viewModel.showAnswer
                          ? 'ANSWER:\n${flashcard.back}'
                          : 'ANSWER:\n••••••••••',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: viewModel.showAnswerToggle,
                  child: Text(viewModel.showAnswer ? 'Hide Answer' : 'Show Answer'),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => viewModel.answer(false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Incorrect'),
                    ),
                    ElevatedButton(
                      onPressed: () => viewModel.answer(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Correct'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Score: ${viewModel.correct} Correct | ${viewModel.incorrect} Incorrect',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
