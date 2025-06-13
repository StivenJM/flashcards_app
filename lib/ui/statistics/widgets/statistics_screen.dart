import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/ui/error_indicator.dart';
import '../view_models/statistics_viewmodel.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key, required this.viewModel});
  final StatisticsViewModel viewModel;

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.load.execute();
    widget.viewModel.updateStatistics.addListener(_onResult);
  }

  @override
  void dispose() {
    widget.viewModel.updateStatistics.removeListener(_onResult);
    super.dispose();
  }

  void _onResult() {
    if (widget.viewModel.updateStatistics.completed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Statistics updated")),
      );
    }
    if (widget.viewModel.updateStatistics.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error updating statistics")),
      );
    }
    widget.viewModel.updateStatistics.clearResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, child) {
            if (widget.viewModel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }
            if (widget.viewModel.load.error || widget.viewModel.statistics == null) {
              return ErrorIndicator(
                title: "Error loading statistics",
                label: "Try again",
                onPressed: widget.viewModel.load.execute,
              );
            }

            final stats = widget.viewModel.statistics!;
            final theme = Theme.of(context);

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tarjetas revisadas: ${stats.totalCardsReviewed}', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('Respuestas correctas: ${stats.correctAnswers}', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text('Respuestas incorrectas: ${stats.wrongAnswers}', style: theme.textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    'Última revisión: ${DateFormat.yMMMd().add_Hm().format(stats.lastReviewed)}',
                    style: theme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      final updated = stats.copyWith(
                        totalCardsReviewed: stats.totalCardsReviewed + 1,
                        correctAnswers: stats.correctAnswers + 1,
                        lastReviewed: DateTime.now(),
                      );
                      widget.viewModel.updateStatistics.execute(updated);
                    },
                    child: const Text('Simular respuesta correcta'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      final updated = stats.copyWith(
                        totalCardsReviewed: stats.totalCardsReviewed + 1,
                        wrongAnswers: stats.wrongAnswers + 1,
                        lastReviewed: DateTime.now(),
                      );
                      widget.viewModel.updateStatistics.execute(updated);
                    },
                    child: const Text('Simular respuesta incorrecta'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
