import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/organisms/organism_home_app_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeAppBar(),
    );
  }
}
