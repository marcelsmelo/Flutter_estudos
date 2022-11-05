import 'package:flutter/services.dart';

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    StringBuffer buffer = StringBuffer();

    final String oldText = oldValue.text;
    final String newText = newValue.text;
    final int length = newText.length;
    int selectionIndex = newValue.selection.end;
    int offset = 0;

    print("Valor antigo $oldText");
    print("Valor Novo $newText");

    if (length == 12) return oldValue;

    for (int i = 0; i <= newText.length; i++) {
      buffer.write(newText.substring(offset, i));
      if (i == length) break;
      if (i == 3) {
        buffer.write('.');
        selectionIndex++;
      }
      if (i == 6) {
        buffer.write('.');
        selectionIndex++;
      }
      if (i == 9) {
        buffer.write('-');
        selectionIndex++;
      }

      offset = i;
    }

    // if (length <= 3) {
    //   buffer.write(text.substring(0, length));
    // }
    // if (length > 3 && length <= 6) {
    //   buffer.write(text.substring(0, 3));
    //   buffer.write('.');
    //   selectionIndex++;
    //   buffer.write(text.substring(3, length));
    // }
    // if (length > 6 && length <= 9) {
    //   buffer.write(text.substring(0, 3));
    //   buffer.write('.');
    //   selectionIndex++;
    //   buffer.write(text.substring(3, 6));
    //   buffer.write('.');
    //   selectionIndex++;
    //   buffer.write(text.substring(6, length));
    // }
    // if (length > 9 && length <= 11) {
    //   buffer.write(text.substring(0, 3));
    //   buffer.write('.');
    //   selectionIndex++;
    //   buffer.write(text.substring(3, 6));
    //   buffer.write('.');
    //   selectionIndex++;
    //   buffer.write(text.substring(6, 9));
    //   buffer.write('-');
    //   selectionIndex++;
    //   buffer.write(text.substring(9, length));
    // }
    // if (length > 11) return oldValue;

    return newValue.copyWith(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
