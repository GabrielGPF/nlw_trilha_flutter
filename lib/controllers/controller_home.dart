import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/models/model_quiz.dart';
import 'package:nlw_trilha_flutter/models/model_user.dart';
import 'package:nlw_trilha_flutter/repositories/repository_home.dart';

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

  final userNotifier = ValueNotifier<UserModel>(
    UserModel(
      name: "Loading",
      photoUrl:
          "https://image.spreadshirtmedia.com/image-server/v1/compositions/T812A1PA3140PT17X94Y56D1003867258FS2652/views/1,width=650,height=650,appearanceId=1,backgroundColor=dadada/the-classic-netscape-icon-is-now-a-mug-drink-your-coffee-like-a-nerd-should.jpg",
      score: 0,
    ),
  );
  set user(UserModel user) => userNotifier.value = user;
  UserModel get user => userNotifier.value;

  final quizzesNotifier = ValueNotifier<List<QuizModel>>([]);
  set quizzes(List<QuizModel> quizzes) => quizzesNotifier.value = quizzes;
  List<QuizModel> get quizzes => quizzesNotifier.value;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;

    // state = HomeState.loading;
    // await Future.delayed(Duration(seconds: 2));
    // user = UserModel(
    //   name: "Gabriel Dev",
    //   photoUrl:
    //       "https://cdn11.bigcommerce.com/s-5ylnei6or5/images/stencil/1280x1280/products/1603/2662/2493_ScoobyDoo_MysteryIncorp_28__55588.1513992629.jpg?c=2",
    // );
    // state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = [...(await repository.getQuizzes())];
    state = HomeState.success;

    // state = HomeState.loading;
    // await Future.delayed(Duration(seconds: 2));
    // quizzes = [
    //   QuizModel(
    //     title: "NLW 5 Flutter",
    //     image: AppImages.blocks,
    //     level: Level.facil,
    //     questions: [
    //       QuestionModel(
    //         title: "Está curtindo o Flutter?",
    //         answers: [
    //           AnswerModel(title: "Estou curtindo"),
    //           AnswerModel(title: "Estou amando"),
    //           AnswerModel(title: "Muito top"),
    //           AnswerModel(title: "Show de bola", isRight: true),
    //         ],
    //       ),
    //     ],
    //   ),
    // ];
    // state = HomeState.success;
  }
}
