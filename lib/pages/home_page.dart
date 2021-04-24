import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/atoms/atom_difficulty_tag.dart';
import 'package:nlw_trilha_flutter/components/molecules/molecule_quiz_card.dart';
import 'package:nlw_trilha_flutter/components/organisms/organism_home_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
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
                  children: [
                    QuizCard(),
                    QuizCard(),
                    QuizCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
