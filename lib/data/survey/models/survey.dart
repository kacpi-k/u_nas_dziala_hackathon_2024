import 'package:u_nas_dziala_hackathon_2024/data/survey/models/question.dart';

class SurveyModel {
  final String surveyId;
  final String trainingId;
  final List<QuestionModel> questions;
  final DateTime createdAt;

  SurveyModel({
    required this.surveyId,
    required this.trainingId,
    required this.questions,
    required this.createdAt,
  });
}
