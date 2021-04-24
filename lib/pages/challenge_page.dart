import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/atoms/atom_next_button.dart';
import 'package:nlw_trilha_flutter/components/molecules/molecule_question_indicator.dart';
import 'package:nlw_trilha_flutter/components/organisms/organism_quiz.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
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
              QuestionIndicator(),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Quiz(
            title: "O que o Flutter faz em sua totalidade?",
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: NextButton.white(
                      label: "Fácil",
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: 7),
                  Expanded(
                    child: NextButton.green(
                      label: "Confirmar",
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
