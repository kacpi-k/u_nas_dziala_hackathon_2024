class QuestionModel {
  final String questionId;
  final String text;
  final String type; // np. 'text', 'rating', 'choice'
  final int maxRating;
  final List<String>? options; // Opcje dla pytań wielokrotnego wyboru

  QuestionModel({
    required this.questionId,
    required this.text,
    required this.type,
    required this.maxRating,
    this.options,
  });
}
