import 'package:flutter/material.dart';

extension MarkDownExtension on TextEditingController {
  void selectedToBold() {
    String selected = selection.textInside(text);
    if (selected.split('').where((element) => element == '*').length >= 4) {
      text = text.replaceRange(
        selection.start,
        selection.end,
        selected.replaceAll('*', ''),
      );
      return;
    }
    final replacement = '**$selected**';
    text = text.replaceRange(
      selection.start,
      selection.end,
      replacement,
    );
  }

  void selectedToItalic() {
    String selected = selection.textInside(text);
    if (selected.split('').where((element) => element == '*').length >= 2) {
      text = text.replaceRange(
        selection.start,
        selection.end,
        selected.replaceAll('*', ''),
      );
      return;
    }
    final replacement = '*$selected*';
    text = text.replaceRange(
      selection.start,
      selection.end,
      replacement,
    );
  }

  void selectedToCrossed() {
    String selected = selection.textInside(text);
    if (selected.split('').where((element) => element == '~').length >= 4) {
      text = text.replaceRange(
        selection.start,
        selection.end,
        selected.replaceAll('~', ''),
      );
      return;
    }
    final replacement = '~~$selected~~';
    text = text.replaceRange(
      selection.start,
      selection.end,
      replacement,
    );
  }

  void selectedToDotList() {
    String selected = selection.textInside(text).replaceAll('\n', '\n+ ');
    if (selected.split('').where((element) => element == '+').length == 1) {
      text = text.replaceRange(
        selection.start,
        selection.end,
        selected.replaceAll('+', ''),
      );
      return;
    }
    final replacement = '+ $selected';
    text = text.replaceRange(
      selection.start,
      selection.end,
      replacement,
    );
  }

  void selectedToNumberList() {
    String selected = selection.textInside(text);
    var numbers = selected.split('\n');
    String replacement = '';
    // if (selected
    //         .split('')
    //         .where((element) => element == RegExp(r'\d+.+( )'))
    //         .length >=
    //     1) {
    //   text = text.replaceRange(
    //     selection.start,
    //     selection.end,
    //     selected.replaceAll(RegExp(r'\d+.+( )'), ''),
    //   );
    //   return;
    // }
    for (final number in numbers) {
      replacement += '${numbers.indexOf(number) + 1}. $number\n';
    }
    text = text.replaceRange(
      selection.start,
      selection.end,
      replacement,
    );
  }
}
