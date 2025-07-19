import 'package:constructo_user/src/features/farmers/views/bookingscreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../home/widgets/appcategory.dart';

class Servicepage extends StatelessWidget {
  const Servicepage({super.key, required this.service});
  final AppCategory service;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Service'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .25,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.gray.withAlpha(100),
                      blurRadius: 2,
                    ),
                  ],
                  image: const DecorationImage(
                    image: AssetImage('assets/images/cement.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                service.name,
                style:
                    AppTextStyles.heading2.copyWith(color: AppColors.green),
              ),
              const SizedBox(height: 10),
              Text(
                service.appDesc,
                style:
                    AppTextStyles.heading2.copyWith(color: AppColors.gray),
              ),
              const SizedBox(height: 10),
              Text(
                'Rs. 1000/hr',
                style: AppTextStyles.heading2
                    .copyWith(color: AppColors.primaryColor),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    
                    Get.to(()=>Bookingscreen());
                  },
                  child: const Text('Book Service'),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .05),
            ],
          ),
        ),
      ),
    );
  }
}
