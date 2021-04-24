import 'package:nlw_trilha_flutter/models/model_answer.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;

  QuestionModel({
    required this.title,
    required this.answers,
  }) : assert(
          answers.length == 4,
        );
}
