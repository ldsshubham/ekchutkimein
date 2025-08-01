import 'package:flutter/material.dart';

import '../../../../constants/app_font_weight.dart';
import '../../../../constants/app_text_styles.dart';

class LoginComponent extends StatelessWidget {
  final TextEditingController mobileController;

  LoginComponent({super.key, required this.mobileController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        Text(
          'Enter Mobile Number To Proceed',
          style: AppTextStyles.heading1.copyWith(
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
        SizedBox(height: 12),
        TextField(
          keyboardType: TextInputType.phone,
          controller: mobileController,
          decoration: InputDecoration(label: Text('Enter Your Mobile Number')),
        ),
      ],
    );
  }
}
