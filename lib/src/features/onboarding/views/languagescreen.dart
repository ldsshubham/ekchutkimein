import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:constructo_user/src/features/onboarding/widgets/custom_lang_tiles.dart';
import 'package:flutter/material.dart';

class LanguageScreening extends StatelessWidget {
  const LanguageScreening({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 24, 16, 0),
      width: double.infinity,
      color: AppColors.white,
      child: ListView.separated(
        itemCount: 15,
        itemBuilder: (context, index) {
          return CustomLanguageTile(title: '', subTitle: '',imgPath: '',);
        },
        separatorBuilder: (context, index) => SizedBox(height: 8),
      ),
    );
  }
}

