import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/statistics_viewmodel.dart';
import '../../../../domain/models/statistics/statistics.dart';
import 'package:intl/intl.dart'; // Para formatear la fecha

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  bool _hasLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasLoaded) {
      final viewModel = Provider.of<StatisticsViewModel>(
        context,
        listen: false,
      );

      // 🔥 Datos quemados para pruebas iniciales
      final fakeStats = Statistics(
        totalCardsReviewed: 50,
        correctAnswers: 35,
        wrongAnswers: 15,
        lastReviewed: DateTime.now(),
      );

      viewModel.updateStatistics(fakeStats);
      _hasLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<StatisticsViewModel>();
    final stats = viewModel.statistics;

    return Scaffold(
      appBar: AppBar(title: const Text('Estadísticas')),
      body: stats == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tarjetas revisadas: ${stats.totalCardsReviewed}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Respuestas correctas: ${stats.correctAnswers}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Respuestas incorrectas: ${stats.wrongAnswers}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Última revisión: ${DateFormat.yMMMd().add_Hm().format(stats.lastReviewed)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Simular una nueva tarjeta revisada con respuesta correcta
                      final newStats = stats.copyWith(
                        totalCardsReviewed: stats.totalCardsReviewed + 1,
                        correctAnswers: stats.correctAnswers + 1,
                        lastReviewed: DateTime.now(),
                      );
                      viewModel.updateStatistics(newStats);
                    },
                    child: const Text('Simular respuesta correcta'),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      // Simular una nueva tarjeta revisada con respuesta incorrecta
                      final newStats = stats.copyWith(
                        totalCardsReviewed: stats.totalCardsReviewed + 1,
                        wrongAnswers: stats.wrongAnswers + 1,
                        lastReviewed: DateTime.now(),
                      );
                      viewModel.updateStatistics(newStats);
                    },
                    child: const Text('Simular respuesta incorrecta'),
                  ),
                ],
              ),
            ),
    );
  }
}
