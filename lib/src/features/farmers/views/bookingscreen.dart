import 'package:collection/collection.dart';
import 'package:constructo_user/src/features/farmers/controllers/bookingcontroller.dart';
import 'package:constructo_user/src/features/farmers/controllers/paymentcontrollers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

import 'package:table_calendar/table_calendar.dart';
import '../../../constants/app_colors.dart';

class Bookingscreen extends StatelessWidget {
  const Bookingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Bookingcontroller bookingcontroller = Get.put(Bookingcontroller());
    final TextEditingController hoursController = TextEditingController();
    final paymentController = Get.put(PaymentController());
    paymentController.setContext(context);
    paymentController.openCheckout();

    return Scaffold(
      appBar: AppBar(title: const Text('Book Your Service')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => TableCalendar(
                    enabledDayPredicate: (day) {
                      return !day.isBefore(DateTime.now()) &&
                          day.weekday != DateTime.sunday;
                    },

                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        final isAvailable = bookingcontroller
                            .availabilityMap
                            .keys
                            .any((d) => isSameDay(d, day));
                        final status = bookingcontroller.availabilityMap.entries
                            .firstWhereOrNull(
                              (entry) => isSameDay(entry.key, day),
                            )
                            ?.value;

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${day.day}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (isAvailable)
                              Text(
                                status!,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.green,
                                ),
                              ),
                          ],
                        );
                      },

                      selectedBuilder: (context, date, _) {
                        return Container(
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: AppColors.primaryColor,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${date.day}',
                            style: TextStyle(color: AppColors.white),
                          ),
                        );
                      },
                    ),
                    locale: 'en_US', // ✅ Fix DateFormat locale error
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay:
                        bookingcontroller.selectedDate.value ?? DateTime.now(),
                    selectedDayPredicate: (day) =>
                        isSameDay(bookingcontroller.selectedDate.value, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      bookingcontroller.selectedDate.value = selectedDay;
                    },
                  ),
                ),

                SizedBox(height: 10),
                Obx(
                  () => Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.gray, width: 2),
                    ),
                    child: Row(
                      children: [
                        Icon(Iconsax.calendar),
                        SizedBox(width: 10),
                        Text(
                          bookingcontroller.selectedDate.value != null
                              ? DateFormat(
                                  'EEE, MMM d, yyyy',
                                ).format(bookingcontroller.selectedDate.value!)
                              : 'No date selected',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: hoursController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    label: Text('Enter Your Expected Hours'),
                    prefixIcon: Icon(Iconsax.clock),
                  ),
                  onChanged: bookingcontroller.updateHours,
                ),
                // SizedBox(height: 16),
                // Text(
                //   'After Paying Amount For Booking You Will Be Updated With Expected Working Hours For Starting Your Work:',
                //   style: TextStyle(fontSize: AppSizes.fontL),
                // ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Pay & Book: ₹${bookingcontroller.totalPrice.toStringAsFixed(2)}',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dialogue function
  Future<dynamic> DialogBoxFunction(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle, size: 60, color: Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Booking Confirmed!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your booking is confirmed.\nTiming will be notified to you.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Get.back(); // or Navigator.pop(context)
                // Optionally: Navigate to another screen
                // Get.to(() => HomePage());
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      ),
    );
  }
}
