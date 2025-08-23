import 'package:constructo_user/src/constants/app_sizes.dart';
import 'package:constructo_user/src/features/farmers/controllers/service_controller.dart';
import 'package:constructo_user/src/features/farmers/views/bookingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';

class Servicepage extends StatelessWidget {
  Servicepage({super.key, required this.serviceId});
  final int serviceId;
  final ServiceController serviceController = Get.put(ServiceController());

  @override
  Widget build(BuildContext context) {
    // Fetch service AFTER the first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (serviceController.servicesitem.value == null) {
        serviceController.fetchService(serviceId);
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Book Service')),
      body: Obx(() {
        if (serviceController.isloading.value) {
          return Center(
            child: LoadingAnimationWidget.waveDots(
              color: AppColors.primaryColor,
              size: 24,
            ),
          );
        } else if (serviceController.servicesitem.value == null) {
          return const Center(child: Text('Service not found'));
        } else {
          final service = serviceController.servicesitem.value!;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .25,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.gray.withAlpha(50),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.gray.withAlpha(100),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Icon(Iconsax.gallery),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    service.servicename,
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                  Text(
                    service.vendorname,
                    style: AppTextStyles.button.copyWith(color: AppColors.gray),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    service.servicedesc,
                    style: AppTextStyles.bodyText.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: AppSizes.fontM,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '₹${service.serviceprice}/${service.unit}',
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.green,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => Bookingscreen());
                      },
                      child: const Text('Book Service'),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
