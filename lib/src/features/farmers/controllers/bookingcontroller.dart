import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bookingcontroller extends GetxController {
  var selectedDate = Rxn<DateTime>();
  var expectedHours = 0.0.obs;

  final TextEditingController hoursController = TextEditingController();
  final availabilityMap = <DateTime, String>{
    DateTime(2025, 7, 20): "2hrs",
    DateTime(2025, 7, 21): "3hrs",
    DateTime(2025, 7, 22): "1hrs",
    DateTime(2025, 7, 23): "7hrs",
    DateTime(2025, 7, 24): "9hrs",
    DateTime(2025, 7, 25): "6hrs",
    DateTime(2025, 7, 26): "6hrs",
    DateTime(2025, 7, 27): "6hrs",
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
