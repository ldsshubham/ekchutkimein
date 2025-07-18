import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import '../controllers/farmercontroller.dart';


class FarmerScreen extends StatelessWidget {
  const FarmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FarmerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hire Or Lease"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.search_normal),
                labelText: "Search services you want to hire or lease",
              ),
            ),
            const SizedBox(height: 12),
            Obx(() {
              final selected = controller.selectedDate.value;
              final displayDate = selected != null
                  ? DateFormat('EEE, MMM d').format(selected)
                  : "Pick a date";

              return Row(
                children: [
                  ChoiceChip(
                    label: Text(displayDate),
                    selected: selected != null,
                    onSelected: (_) => controller.selectDate(context),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
