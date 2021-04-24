import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/atoms/atom_progress_indicator.dart';
import 'package:nlw_trilha_flutter/core/app_text_styles.dart';

class QuestionIndicator extends StatelessWidget {
  final int currentPage;
  final int length;

  QuestionIndicator({
    required this.currentPage,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questao $currentPage",
                style: AppTextStyles.body,
              ),
              Text(
                "de $length",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: currentPage / length),
        ],
      ),
    );
  }
}
