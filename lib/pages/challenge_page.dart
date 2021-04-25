import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/atoms/atom_next_button.dart';
import 'package:nlw_trilha_flutter/components/molecules/molecule_question_indicator.dart';
import 'package:nlw_trilha_flutter/components/organisms/organism_quiz.dart';
import 'package:nlw_trilha_flutter/controllers/controller_challenge.dart';
import 'package:nlw_trilha_flutter/models/model_question.dart';
import 'package:nlw_trilha_flutter/pages/result_page.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String title;

  ChallengePage({
    required this.questions,
    required this.title,
  });

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = new ChallengeController();
  final pageController = new PageController();

  void nextPage() {
    if (controller.currentPage < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 100),
        curve: Curves.linear,
      );
    }
  }

  void onSelected(bool isRight) {
    if (isRight) {
      controller.rightAnswersQuantity++;
    }

    nextPage();
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: BackButton(),
              ),
              ValueListenableBuilder(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicator(
                  currentPage: controller.currentPage,
                  length: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: widget.questions
                .map(
                  (e) => QuizQuestion(
                    question: e,
                    onSelected: onSelected,
                  ),
                )
                .toList(),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      if ((value as int) < widget.questions.length)
                        Expanded(
                          child: NextButton.white(
                            label: "Pular",
                            onTap: nextPage,
                          ),
                        ),
                      if (value == widget.questions.length) SizedBox(width: 7),
                      if (value == widget.questions.length)
                        Expanded(
                          child: NextButton.green(
                            label: "Confirmar",
                            onTap: () => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  result: controller.rightAnswersQuantity,
                                  title: widget.title,
                                  length: widget.questions.length,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
