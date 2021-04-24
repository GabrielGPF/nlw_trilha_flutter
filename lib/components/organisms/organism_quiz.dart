import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/molecules/molecule_quiz_answer.dart';
import 'package:nlw_trilha_flutter/core/app_text_styles.dart';

class Quiz extends StatelessWidget {
  final String title;

  Quiz({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: AppTextStyles.heading,
        ),
        SizedBox(height: 24),
        QuizAnswer(
          isRight: true,
          isSelected: true,
          title: "Possibilita a criação de aplicativos compilados nativamente.",
        ),
        QuizAnswer(
          isRight: false,
          isSelected: true,
          title: "Possibilita a criação de aplicativos compilados nativamente.",
        ),
        QuizAnswer(
          isRight: true,
          isSelected: false,
          title: "Possibilita a criação de aplicativos compilados nativamente.",
        ),
        QuizAnswer(
          isRight: false,
          isSelected: false,
          title: "Possibilita a criação de aplicativos compilados nativamente.",
        ),
      ],
    );
  }
}
