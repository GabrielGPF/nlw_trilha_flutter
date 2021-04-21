import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/molecules/molecule_home_score_card.dart';
import 'package:nlw_trilha_flutter/core/app_gradients.dart';
import 'package:nlw_trilha_flutter/core/app_text_styles.dart';

class HomeAppBar extends PreferredSize {
  HomeAppBar()
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
                              text: "Gabul DEV",
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
                              "https://cdn11.bigcommerce.com/s-5ylnei6or5/images/stencil/1280x1280/products/1603/2662/2493_ScoobyDoo_MysteryIncorp_28__55588.1513992629.jpg?c=2",
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
