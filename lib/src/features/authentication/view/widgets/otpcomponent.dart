import 'package:flutter/material.dart';
import '../../../../constants/app_font_weight.dart';
import '../../../../constants/app_text_styles.dart';

class OtpComponent extends StatelessWidget {
  final TextEditingController otpController;
  const OtpComponent({super.key, required this.otpController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
        Text(
          'Enter OTP from\nPhone',
          style: AppTextStyles.heading1.copyWith(
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
        SizedBox(height: 12),
        TextField(decoration: InputDecoration(label: Text('Enter the OTP'))),
      ],
    );
  }
}
