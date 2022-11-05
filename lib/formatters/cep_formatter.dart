import 'package:flutter/services.dart';

class CepInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final String text = newValue.text;
    final int textLength = text.length;
    int selection = textLength;
    int offset = 0;

    StringBuffer buffer = StringBuffer();

    if (text.length <= 5) {
      buffer.write(text.substring(offset, textLength));
    }
    if (text.length > 5) {
      buffer.write(text.substring(offset, 5));
      offset = 5;
      buffer.write('-');
      selection++;
      buffer.write(text.substring(offset, text.length));
    }
    if (text.length == 9) return oldValue;

    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: selection),
    );
  }
}
