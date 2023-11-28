// import '../utils/styles.dart';
// import 'package:flutter/material.dart';

// import 'custom_icon_button.dart';

// class CustomCalendar extends StatefulWidget {
//   PageController controller;
//   bool Function(DateTime)? selectedDayPredicate;
//   List Function(DateTime)? eventLoader;
//   void Function(DateTime, DateTime)? onDaySelected;
//   Color? leftChevronColor;
//   Color? rightChevronColor;
//   List<Color> selectedDataColors;
//   CustomCalendar({
//     super.key,
//     required this.controller,
//     this.selectedDayPredicate,
//     this.eventLoader,
//     this.onDaySelected,
//     this.leftChevronColor = Styles.solidOrange,
//     this.rightChevronColor = Styles.solidOrange,
//     this.selectedDataColors = Styles.orangeGradientColor,
//   });

//   @override
//   State<CustomCalendar> createState() => _CustomCalendarState();
// }

// class _CustomCalendarState extends State<CustomCalendar> {
//   bool _isCurrentMonth(DateTime day) {
//     final now = DateTime.now();
//     return day.year == now.year && day.month == now.month;
//   }

//   DateTime _focusedDay = DateTime.now();
//   DateTime _currentDay = DateTime.now();
//   @override
//   Widget build(BuildContext context) {
//     return TableCalendar(
//       onCalendarCreated: (PageController p) {
//        widget. controller = p;

//       },
//       eventLoader: widget.eventLoader,
//       firstDay: DateTime.utc(2010, 10, 16),
//       lastDay: DateTime.utc(2030, 3, 14),
//       focusedDay: _focusedDay,
//       onPageChanged: (v){
//         setState(() {
//           _focusedDay = v;
//         });
//       },
//       calendarFormat: CalendarFormat.month,

//       currentDay: _currentDay,
//       headerStyle: HeaderStyle(
//         titleCentered: true,
//         titleTextStyle: const TextStyle(fontFamily: "Manrope", fontWeight: FontWeight.w700, fontSize: 16),
//         formatButtonVisible: false,
//         headerPadding: const EdgeInsets.only(

//             right: 40, left: 40,bottom: 30,top: 10),
//         leftChevronIcon:
//         _isCurrentMonth(_focusedDay) ?
//         CustomIconButton(
//           height: 26,
//           width: 26,
//           onTap: () {
//           },
//           color: Colors.grey.withOpacity(0.5),
//           isIconString: false,
//           iconIcon: const Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Styles.white,
//             size: 10,
//           ),
//         )

//           :
//         CustomIconButton(
//           height: 26,
//           width: 26,
//           onTap: () {
//             widget.controller.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
//           },
//           color: widget.leftChevronColor,
//           isIconString: false,
//           iconIcon: const Icon(
//             Icons.arrow_back_ios_rounded,
//             color: Styles.white,
//             size: 10,
//           ),
//         ),
//         rightChevronIcon: CustomIconButton(
//           height: 26,
//           width: 26,
//           onTap: () {
//             widget.controller.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.bounceIn);
//           },
//           color: widget.rightChevronColor,
//           isIconString: false,
//           iconIcon: const Icon(
//             Icons.arrow_forward_ios_rounded,
//             color: Styles.white,
//             size: 10,
//           ),
//         ),
//       ),
//       daysOfWeekStyle: const DaysOfWeekStyle(
//         weekdayStyle: TextStyle(fontFamily: "Manrope", fontWeight: FontWeight.w700, fontSize: 14, color: Styles.greyLight2),
//         weekendStyle: TextStyle(fontFamily: "Manrope", fontWeight: FontWeight.w700, fontSize: 14, color: Styles.greyLight2),
//       ),
//       calendarStyle: CalendarStyle(
//         defaultTextStyle: const TextStyle(fontFamily: "Manrope", fontWeight: FontWeight.w700, fontSize: 14, color: Styles.black),
//         disabledTextStyle: const TextStyle(fontFamily: "Manrope", fontWeight: FontWeight.w700, fontSize: 14, color: Styles.black),
//         holidayTextStyle: const TextStyle(fontFamily: "Manrope", fontWeight: FontWeight.w700, fontSize: 14, color: Styles.black),
//         weekendTextStyle: const TextStyle(fontFamily: "Manrope", fontWeight: FontWeight.w700, fontSize: 14, color: Styles.black),
//         selectedTextStyle: const TextStyle(fontFamily: "Manrope", fontWeight: FontWeight.w700, fontSize: 14, color: Styles.white),
//         outsideTextStyle: const TextStyle(fontFamily: "Manrope", fontWeight: FontWeight.w700, fontSize: 14, color: Colors.transparent),
//         cellPadding: const EdgeInsets.symmetric(vertical: 8),
//         markerDecoration: const BoxDecoration(
//           color: Styles.red,
//           shape: BoxShape.circle,
//         ),
//         isTodayHighlighted: false,
//         selectedDecoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: widget.selectedDataColors,
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             //transform: GradientRotation(200),
//           ),
//           shape: BoxShape.circle,
//         ),
//       ),
//       selectedDayPredicate: widget.selectedDayPredicate,
//       onDaySelected: widget.onDaySelected,
//       startingDayOfWeek: StartingDayOfWeek.monday,


//     );
//   }
// }
