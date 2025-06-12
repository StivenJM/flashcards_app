class Statistics {
  final int totalCardsReviewed;
  final int correctAnswers;
  final int wrongAnswers;
  final DateTime lastReviewed;

  Statistics({
    required this.totalCardsReviewed,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.lastReviewed,
  });

  Statistics copyWith({
    int? totalCardsReviewed,
    int? correctAnswers,
    int? wrongAnswers,
    DateTime? lastReviewed,
  }) {
    return Statistics(
      totalCardsReviewed: totalCardsReviewed ?? this.totalCardsReviewed,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      wrongAnswers: wrongAnswers ?? this.wrongAnswers,
      lastReviewed: lastReviewed ?? this.lastReviewed,
    );
  }
}
