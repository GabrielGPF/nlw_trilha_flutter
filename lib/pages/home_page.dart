import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/atoms/atom_difficulty_tag.dart';
import 'package:nlw_trilha_flutter/components/molecules/molecule_quiz_card.dart';
import 'package:nlw_trilha_flutter/components/organisms/organism_home_app_bar.dart';
import 'package:nlw_trilha_flutter/controllers/controller_home.dart';
import 'package:nlw_trilha_flutter/core/app_colors.dart';
import 'package:nlw_trilha_flutter/pages/challenge_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() => setState(() {}));
    controller.userNotifier.addListener(() => setState(() {}));
    controller.quizzesNotifier.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: HomeAppBar(
          user: controller.user,
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 24.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DifficultyTag(label: "Fácil"),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DifficultyTag(label: "Médio"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DifficultyTag(label: "Difícil"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: DifficultyTag(label: "Perito"),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.0),
                Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    crossAxisCount: 2,
                    children: controller.quizzes.map(
                      (e) {
                        return QuizCard(
                          title: e.title,
                          completed:
                              "${e.questionsAnswered}/${e.questions.length}",
                          percent: e.questionsAnswered / e.questions.length,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChallengePage(
                                  questions: e.questions,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}
