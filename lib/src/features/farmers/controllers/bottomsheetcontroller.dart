
import 'package:get/get.dart';

class Bottomsheetcontroller extends GetxController {
  // Reactive nullable DateTime
  Rxn<DateTime> selectedDate = Rxn<DateTime>();

  // Getter to format the date
  String get formattedDate {
    if (selectedDate.value == null) return 'Select Date';
    final d = selectedDate.value!;
    return '${d.day}-${_monthAbbr(d.month)}-${d.year}';
  }
  
  String _monthAbbr(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  // ✅ The missing method
  void updateDate(DateTime date) {
    selectedDate.value = date;
  }
}
