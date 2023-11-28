// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// import '../domain/entities/consultation_model.dart';
// import '../utils/styles.dart';
// import 'custom_text_component.dart';

// class PercentageComponent extends StatelessWidget {
//   const PercentageComponent({
//     super.key,
//     required this.items,
//   });

//   final ConsultationModel items;

//   @override
//   Widget build(BuildContext context) {
//     return CircularPercentIndicator(
//       radius: 20.0,
//       lineWidth: 2.0,
//       animation: true,
//       percent: (items.hourly == 1)
//           ? 0.1
//           : (items.hourly == 2)
//               ? 0.2
//               : 0.6,
//       backgroundColor: Styles.solidGrey.withOpacity(0.3),
//       center: CustomTextWidget(
//         text: "${items.hourly}h",
//         color: Styles.black,
//         fontSize: 14,
//         fontWeight: FontWeight.w700,
//         lineHeight: 1.79,
//       ),
//       progressColor: items.hourly?.compareTo(3) == -1 ? Colors.red : Styles.green,
//     );
//   }
// }
