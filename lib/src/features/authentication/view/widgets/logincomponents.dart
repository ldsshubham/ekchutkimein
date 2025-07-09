import 'package:flutter/material.dart';

import '../../../../constants/app_font_weight.dart';
import '../../../../constants/app_text_styles.dart';

class SignupComponent extends StatelessWidget {
  const SignupComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        Text(
          'Login to Your\nAccount',
          style: AppTextStyles.heading1.copyWith(
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(label: Text('Enter Your Mobile Number')),
        ),
      ],
    );
  }
}
