import 'package:flutter/cupertino.dart';
import 'package:nlw_trilha_flutter/core/app_images.dart';
import 'package:nlw_trilha_flutter/models/model_answer.dart';
import 'package:nlw_trilha_flutter/models/model_question.dart';
import 'package:nlw_trilha_flutter/models/model_quiz.dart';
import 'package:nlw_trilha_flutter/models/model_user.dart';

enum HomeState {
  success,
  loading,
  error,
  empty,
}

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));

    user = UserModel(
      name: "Gabriel Dev",
      photoUrl:
          "https://cdn11.bigcommerce.com/s-5ylnei6or5/images/stencil/1280x1280/products/1603/2662/2493_ScoobyDoo_MysteryIncorp_28__55588.1513992629.jpg?c=2",
    );

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
        title: "NLW 5 Flutter",
        image: AppImages.blocks,
        level: Level.facil,
        questions: [
          QuestionModel(
            title: "Está curtindo o Flutter?",
            answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Estou amando"),
              AnswerModel(title: "Muito top"),
              AnswerModel(title: "Show de bola", isRight: true),
            ],
          ),
        ],
      ),
    ];

    state = HomeState.success;
  }
}
