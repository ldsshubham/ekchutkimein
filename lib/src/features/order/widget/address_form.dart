import 'package:constructo_user/src/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AddressForm extends StatelessWidget {
  final String addType;
  const AddressForm({super.key, required this.addType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .4,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray.withAlpha(50),
            offset: Offset.zero,
            blurRadius: 2,
          ),
        ],
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(addType, style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(hintText: "Name")),
            SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(hintText: "Mobile Number"),
            ),
            SizedBox(height: 10),
            TextFormField(decoration: InputDecoration(hintText: "Email")),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Address Line 1"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Address Line 2"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "City"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Pincode"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
