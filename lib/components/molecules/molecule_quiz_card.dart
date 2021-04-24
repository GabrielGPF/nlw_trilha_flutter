import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/atoms/atom_progress_indicator.dart';
import 'package:nlw_trilha_flutter/core/app_colors.dart';
import 'package:nlw_trilha_flutter/core/app_images.dart';
import 'package:nlw_trilha_flutter/core/app_text_styles.dart';

class QuizCard extends StatelessWidget {
  final String title;
  final String completed;
  final double percent;

  QuizCard({
    required this.title,
    required this.completed,
    required this.percent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.border,
            width: 2,
          ),
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          // SizedBox(height: 16),
          Spacer(),
          Text(
            title,
            style: AppTextStyles.heading15,
          ),
          // SizedBox(height: 12),
          Spacer(),
          Row(
            children: [
              Text(
                completed,
                style: AppTextStyles.body11,
              ),
              SizedBox(width: 24),
              Expanded(
                flex: 2,
                child: ProgressIndicatorWidget(value: percent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
