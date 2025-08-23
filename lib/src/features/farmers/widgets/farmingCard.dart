import 'package:constructo_user/src/features/farmers/views/servicepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../constants/app_colors.dart';

class FarmingCard extends StatelessWidget {
  const FarmingCard({
    super.key,
    required this.servicename,
    required this.servicedesc,
    required this.serviceprice,
    required this.serviceunit,
    required this.serviceId,
  });

  final String servicename;
  final String servicedesc;
  final String serviceprice;
  final String serviceunit;
  final int serviceId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Servicepage(serviceId: serviceId));
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: constraints.maxWidth * 0.6,
                    decoration: BoxDecoration(
                      color: AppColors.gray.withAlpha(50),
                    ),
                    child: Icon(Iconsax.gallery),
                  ),
                ),

                // Text and Price
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        servicename,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      // const SizedBox(height: 4),
                      Text(
                        servicedesc,
                        style: const TextStyle(fontSize: 12),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // const SizedBox(height: 8),
                      Text(
                        '₹${serviceprice}/${serviceunit}',
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
