// import 'package:nlw_trilha_flutter/home/home_page.dart';
// import 'package:nlw_trilha_flutter/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/pages/challenge_page.dart';
import 'package:nlw_trilha_flutter/pages/home_page.dart';
import 'package:nlw_trilha_flutter/pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "DevQuiz",
      home: ChallengePage(),
    );
  }
}
