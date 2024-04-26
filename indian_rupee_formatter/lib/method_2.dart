// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// // class RupeeFormatter extends StatefulWidget {
// //   const RupeeFormatter({super.key});

// //   @override
// //   State<RupeeFormatter> createState() => _RupeeFormatterState();
// // }

// // class _RupeeFormatterState extends State<RupeeFormatter> {
// //   final numberFormat = NumberFormat.decimalPattern('hi-IN');
// //   String formattedValue = ''; // To store the formatted number

// //   // ignore: non_constant_identifier_names
// //   void RupeeFormatter(String value) {
// //     if (value.isEmpty) {
// //       formattedValue = ''; // Clear when empty
// //     } else {
// //       formattedValue = numberFormat.format(double.parse(value));
// //     }
// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('RUPEE FORMATTER'),
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           const Padding(
// //             padding: EdgeInsets.only(top: 16, left: 16),
// //             child: Text(
// //               'Amount To WithDrawal',
// //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
// //             ),
// //           ),
// //           Padding(
// //             padding: const EdgeInsets.all(16),
// //             child: TextFormField(
// //               onChanged: RupeeFormatter, // Call formatNumber on change
// //               keyboardType: TextInputType.number,
// //               decoration: InputDecoration(
// //                 hintText: '₹',
// //                 border: const OutlineInputBorder(),
// //                 // Display formatted value directly
// //                 suffixText: formattedValue.isNotEmpty ? '₹ $formattedValue' : null,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class RupeeFormatter extends StatefulWidget {
//   const RupeeFormatter({Key? key}) : super(key: key);

//   @override
//   State<RupeeFormatter> createState() => _RupeeFormatterState();
// }

// class _RupeeFormatterState extends State<RupeeFormatter> {
//   final NumberFormat numberFormat = NumberFormat.decimalPattern('hi-IN');
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('RUPEE FORMATTER'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 16, left: 16),
//             child: Text(
//               'Amount To WithDrawal',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextFormField(
//               controller: _controller,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 hintText: '₹',
//                 border: const OutlineInputBorder(),
//                 // Display formatted value directly
//                 suffixText: _controller.text.isEmpty
//                     ? null
//                     : '₹ ${numberFormat.format(double.tryParse(_controller.text) ?? 0)}',
//               ),
//               onChanged: (value) {
//                 setState(() {}); // Trigger rebuild to update suffix text
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // void main() {
// //   runApp(const MaterialApp(
// //     home: RupeeFormatter(),
// //   ));
// // }
