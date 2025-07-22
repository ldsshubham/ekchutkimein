import 'package:constructo_user/src/constants/app_sizes.dart';
import 'package:constructo_user/src/features/farmers/views/bookingscreen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../home/widgets/appcategory.dart';

class Servicepage extends StatelessWidget {
  const Servicepage({super.key, required this.service});
  final FarmingServices service;

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
                  image: DecorationImage(
                    image: AssetImage(service.imgPath),
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
                    AppTextStyles.bodyText.copyWith(color: AppColors.gray, fontSize: AppSizes.fontXL),
              ),
              const SizedBox(height: 10),
              Text(
                '₹${service.price.toString()}/hr',
                style: AppTextStyles.heading2
                    .copyWith(color: AppColors.green),
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
