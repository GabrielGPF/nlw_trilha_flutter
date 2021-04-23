import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/atoms/atom_difficulty_tag.dart';
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
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
            ),
          ],
        ),
      ),
    );
  }
}
