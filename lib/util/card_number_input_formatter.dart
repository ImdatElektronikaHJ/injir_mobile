import 'package:flutter/services.dart';

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var nonZeroIndex = 0;

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != ' ') {
        valueToReturn += newValueString[i];
      }

      if (newValueString[newValueString.length - 1] == ' ') {
        valueToReturn = newValueString.substring(0, newValueString.length - 1);
        continue;
      }

      if (newValueString[i] == ' ') {
        continue;
      }

      nonZeroIndex++;

      if (nonZeroIndex % 4 == 0 && nonZeroIndex != newValueString.length) {
        valueToReturn += ' ';
        nonZeroIndex = 0;
      }
    }

    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}
