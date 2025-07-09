import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/features/onboarding/widgets/custom_lang_tiles.dart';
import 'package:constructo_user/src/localization/applocalization.dart';
import 'package:flutter/material.dart';

class LanguageScreening extends StatelessWidget {
  const LanguageScreening({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      width: double.infinity,
      color: AppColors.white,
      child: ListView.separated(
        itemCount: languageData.length,
        itemBuilder: (context, index) {
          final lang = languageData[index];
          return CustomLanguageTile(
            title: lang['title'] ?? '',
            subTitle: lang['subTitle'] ?? '',
            imgPath: lang['imgPath'] ?? '',
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }
}
