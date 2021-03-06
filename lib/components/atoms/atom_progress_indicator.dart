import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/core/app_colors.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;

  ProgressIndicatorWidget({
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: AppColors.chartSecondary,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
    );
  }
}
