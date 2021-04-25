import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/molecules/molecule_quiz_answer.dart';
import 'package:nlw_trilha_flutter/core/app_text_styles.dart';
import 'package:nlw_trilha_flutter/models/model_answer.dart';
import 'package:nlw_trilha_flutter/models/model_question.dart';

class QuizQuestion extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  QuizQuestion({
    required this.question,
    required this.onSelected,
  });

  @override
  _QuizQuestionState createState() => _QuizQuestionState();
}

class _QuizQuestionState extends State<QuizQuestion> {
  int selectedIndex = -1;

  AnswerModel answers(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.question.title,
          style: AppTextStyles.heading,
        ),
        SizedBox(height: 24),
        for (var i = 0; i < widget.question.answers.length; i++)
          QuizAnswer(
            answer: answers(i),
            isSelected: selectedIndex == i,
            disabled: selectedIndex != -1,
            onTap: (bool isRight) {
              setState(() {
                selectedIndex = i;
              });
              Future.delayed(Duration(seconds: 1)).then(
                (_) => widget.onSelected(isRight),
              );
            },
          ),
      ],
    );
  }
}
