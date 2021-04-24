import 'package:flutter/material.dart';
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
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          top: true,
          child: QuestionIndicator(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Quiz(
          title: "O que o Flutter faz em sua totalidade?",
        ),
      ),
    );
  }
}
