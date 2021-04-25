import 'package:flutter/material.dart';
import 'package:nlw_trilha_flutter/components/atoms/atom_next_button.dart';
import 'package:nlw_trilha_flutter/core/app_images.dart';
import 'package:nlw_trilha_flutter/core/app_text_styles.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int result;

  ResultPage({
    required this.title,
    required this.length,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            SizedBox(height: 16),
            Text(
              "Parabéns!",
              style: AppTextStyles.heading40,
            ),
            SizedBox(height: 16),
            Text.rich(
              TextSpan(
                text: "Você concluiu",
                style: AppTextStyles.body,
                children: [
                  TextSpan(
                    text: "\n$title",
                    style: AppTextStyles.bodyBold,
                  ),
                  TextSpan(
                    text: "\ncom $result de $length acertos.",
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  NextButton.purple(label: "Compartilhar", onTap: () {}),
                  SizedBox(height: 24),
                  NextButton.transparent(
                    label: "Voltar ao início",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
