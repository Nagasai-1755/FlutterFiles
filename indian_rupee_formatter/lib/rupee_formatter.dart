// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';

// // void main() {
// //   runApp(const MaterialApp(
// //     home: RupeeFormatter(),
// //   ));
// // }
// class RupeeFormatter extends StatefulWidget {
//   const RupeeFormatter({super.key});

//   @override
//   State<RupeeFormatter> createState() => _RupeeFormatterState();
// }

// class _RupeeFormatterState extends State<RupeeFormatter> {
//   final NumberFormat numberFormat = NumberFormat.decimalPattern('hi-IN');
//   final TextEditingController _controller = TextEditingController();
//   bool _isUpdating = false; // Flag to prevent recursion

//   @override
//   void initState() {
//     super.initState();
//     _controller.addListener(_onTextChanged);
//   }

//   @override
//   void dispose() {
//     _controller.removeListener(_onTextChanged);
//     _controller.dispose();
//     super.dispose();
//   }

//   void _onTextChanged() {
//     if (!_isUpdating) {
//       _isUpdating = true;
//       final value = _controller.text.replaceAll(RegExp(r'[^0-9\.]'), '');
//       final formattedValue = numberFormat.format(double.tryParse(value) ?? 0);
//       _controller.value = TextEditingValue(
//         text: '₹$formattedValue',
//         selection: TextSelection.collapsed(offset: formattedValue.length + 1),
//       );
//       _isUpdating = false;
//     }
//   }

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
//               'Amount To Withdrawal',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextFormField(
//               controller: _controller,
//               keyboardType: const TextInputType.numberWithOptions(decimal: true),
//               inputFormatters: [
//   FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
//   LengthLimitingTextInputFormatter(13),
//   DoubleValueValidator(decimalPoint: 2)
// ],
  
//               decoration: const InputDecoration(
//                 hintText: '₹',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DoubleValueValidator extends TextInputFormatter {
//   int decimalPoint;
//   DoubleValueValidator({this.decimalPoint = 2});

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     String value = newValue.text;
//     final double getDoubleValue = (value != '' && (value.indexOf('0') == 0))? double.parse(value) : 0;
//     int selectionIndexFromTheRight = value.length - newValue.selection.end;
//     if (value.split('.').length > 2 || (getDoubleValue > 9999999999.99)) {
//       value = oldValue.text;
//       selectionIndexFromTheRight = value.length - oldValue.selection.end;
//     }

//     final bool checkFloat =
//         value.contains('.') && (value.split('.')[1]).isNotEmpty;
//     if (checkFloat) {
//       final String split1 = value.split('.')[0];
//       final String split2 = value.split('.')[1];

//       value = split1 +
//           '.' +
//           (split2.length > decimalPoint
//               ? split2.substring(0, decimalPoint)
//               : split2);

//       if (getDoubleValue > 9999999999.99) {
//         value = oldValue.text;
//         selectionIndexFromTheRight = value.length - oldValue.selection.end;
//       }
//     }
//     return TextEditingValue(
//       text: value,
//       selection: 
//       TextSelection.collapsed(
//         offset: value.length - selectionIndexFromTheRight,
//       ),
      
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class RupeeFormatter extends StatefulWidget {
  const RupeeFormatter({Key? key}) : super(key: key);


  @override
  State<RupeeFormatter> createState() => _RupeeFormatterState();
}


class _RupeeFormatterState extends State<RupeeFormatter> {
  final TextEditingController _controller = TextEditingController();
  final NumberFormat _numberFormat = NumberFormat.decimalPattern('en-IN');


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  void rupeeFormatter(String value) {
  // Remove any non-numeric characters from the input value
  final numericValue = value.replaceAll(RegExp(r'[^\d.]'), '');


  if (numericValue.isNotEmpty) {
    final formattedValue = _numberFormat.format(double.parse(numericValue)).toString();
    _controller.text = '₹ $formattedValue';
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: _controller.text.length),
    );
  } else {
    _controller.text = '';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RUPEE FORMATTER'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16),
            child: const Text(
              'Amount To Withdrawal',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: _controller,
              onChanged: rupeeFormatter,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                hintText: '₹',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


void main() {
  runApp(const MaterialApp(
    home: RupeeFormatter(),
  ));
}










