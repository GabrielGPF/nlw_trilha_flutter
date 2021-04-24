import 'package:nlw_trilha_flutter/models/model_question.dart';

enum Level {
  facil,
  medio,
  dificil,
  perito,
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnswered = 0,
    required this.image,
    required this.level,
  });
}
