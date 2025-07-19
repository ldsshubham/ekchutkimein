import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../constants/app_colors.dart';

class BookingBottomSheet extends StatelessWidget {
  const BookingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // final Bottomsheetcontroller controller = Get.put(Bottomsheetcontroller());

    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return SingleChildScrollView( // ✅ Prevent overflow
          child: Column(
            mainAxisSize: MainAxisSize.min, // ✅ Fit to content
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(() {
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Iconsax.calendar, color: AppColors.primaryColor),
                              SizedBox(width: 8),
                              Text(
                                '10-Dec-2025',
                                style: TextStyle(color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: (){}
                      ,
                      child: Text('Choose Date'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
