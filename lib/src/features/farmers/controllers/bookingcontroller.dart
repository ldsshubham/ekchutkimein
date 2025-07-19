import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bookingcontroller extends GetxController {
  var selectedDate = Rxn<DateTime>();
  var expectedHours = 0.0.obs;

  final TextEditingController hoursController = TextEditingController();
  final availabilityMap = <DateTime, String>{
    DateTime(2025, 7, 20): "2hr",
    DateTime(2025, 7, 21): "3hr",
    DateTime(2025, 7, 22): "1hr",
    DateTime(2025, 7, 23): "7hr",
    DateTime(2025, 7, 24): "9hr",
    DateTime(2025, 7, 25): "6hr",
  }.obs;

  double get totalPrice => expectedHours.value * 1000;

  void updateHours(String value) {
    final parsed = double.tryParse(value);
    if (parsed != null && parsed >= 0) {
      expectedHours.value = parsed;
    } else {
      expectedHours.value = 0;
    }
  }
}
