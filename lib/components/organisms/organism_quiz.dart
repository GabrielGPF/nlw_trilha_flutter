import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/molecules/molecule_quiz_answer.dart';
import 'package:nlw_trilha_flutter/core/app_text_styles.dart';
import 'package:nlw_trilha_flutter/models/model_question.dart';

class QuizQuestion extends StatelessWidget {
  final QuestionModel question;

  QuizQuestion({
    required this.question,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          question.title,
          style: AppTextStyles.heading,
        ),
        SizedBox(height: 24),
        ...question.answers.map(
          (e) => QuizAnswer(
            title: e.title,
            isRight: e.isRight,
          ),
        ),
      ],
    );
  }
}
