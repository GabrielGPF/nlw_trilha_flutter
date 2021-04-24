import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/molecules/molecule_home_score_card.dart';
import 'package:nlw_trilha_flutter/core/app_gradients.dart';
import 'package:nlw_trilha_flutter/core/app_text_styles.dart';
import 'package:nlw_trilha_flutter/models/model_user.dart';

class HomeAppBar extends PreferredSize {
  final UserModel user;
  HomeAppBar({required this.user})
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 250,
            child: Stack(
              children: [
                Container(
                  height: 161,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(gradient: AppGradients.linear),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Olá, ",
                          style: AppTextStyles.title,
                          children: [
                            TextSpan(
                              text: user.name,
                              style: AppTextStyles.titleBold,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 58,
                        width: 58,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(
                              user.photoUrl,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(0.0, 1.0),
                  child: ScoreCard(),
                ),
              ],
            ),
          ),
        );
}
