import 'package:get/get.dart';

class DatePickerModel {
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedDateTo = Rx<DateTime?>(null);
}
