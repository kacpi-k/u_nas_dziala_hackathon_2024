class SurveyResponse {
  final String responseId;
  final String surveyId;
  final String userId;
  final Map<String, dynamic> answers;
  final DateTime submittedAt;

  SurveyResponse({
    required this.responseId,
    required this.surveyId,
    required this.userId,
    required this.answers,
    required this.submittedAt,
  });
}
