import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FarmerController extends GetxController {
  final Rxn<DateTime> selectedDate = Rxn<DateTime>();

  void selectDate(BuildContext context) async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  String get formattedDate {
    if (selectedDate.value == null) return "Pick a date";
    return '${selectedDate.value!.day}, '
        '${selectedDate.value!.month}, '
        '${selectedDate.value!.year}';
  }


  
}
