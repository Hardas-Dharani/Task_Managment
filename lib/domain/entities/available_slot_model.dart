class TimesOfTheDay {
  List<AvailableSlotModel> morningSlots;
  List<AvailableSlotModel> noonSlots;
  List<AvailableSlotModel> eveningSlots;

  TimesOfTheDay({
    required this.morningSlots,
    required this.noonSlots,
    required this.eveningSlots,
  });
}

class AvailableSlotModel {
  final String? time;
  final bool isAvailable;

  AvailableSlotModel({required this.time, this.isAvailable = true});
}

// "available_slots":
// {
//   "morning_slots": {
//     [
//       {"time_slot":"08:00","is_available": false},
//       {"time_slot":"09:00","is_available": false},
//       {"time_slot":"10:00","is_available": false},
//     ],
//
//   },
//   "noon_slots": {
//     [
//       {"time_slot":"08:00","is_available": false},
//       {"time_slot":"09:00","is_available": false},
//       {"time_slot":"10:00","is_available": false},
//     ],
//
//   },
//   "evening_slots": {
//     [
//       {"time_slot":"08:00","is_available": false},
//       {"time_slot":"09:00","is_available": false},
//       {"time_slot":"10:00","is_available": false},
//     ],
//   },
//
// }
