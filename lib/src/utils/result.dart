import 'package:flutter/material.dart';

enum Accuracy {
  perfect, // spot-on
  great, // up to 10%, or <$1 for small amounts
  close, // up to 25%, or <$2.50 for small amounts
  bad, // up to 50%, or <$5 for small amounts
  awful, // upwards of that
}

/// Return a measure of the accuracy of the guess.
/// For large amounts (over 10) use a percentage, as being relatively close is what matters.
/// For small amounts, being 5 or 10c off doesn't really matter, so limit it to more specific ranges.
Accuracy measureAccuracy(double guess, double result) {
  int diff;

  if (guess > 10) {
    diff = (((guess - result) / result) * 100).truncate().abs();
  } else {
    diff = (((guess - result) / 10) * 100).truncate().abs();
  }

  if (diff < 1) return Accuracy.perfect;

  if (diff < 10) return Accuracy.great;

  if (diff < 25) return Accuracy.close;

  if (diff < 50) return Accuracy.bad;

  return Accuracy.awful;
}

Color resultColor(Accuracy acc) {
  switch (acc) {
    case Accuracy.perfect:
      return Colors.green.shade300;
      break;
    case Accuracy.great:
      return Colors.lightGreen.shade300;
      break;
    case Accuracy.close:
      return Colors.lime.shade300;
      break;
    case Accuracy.bad:
      return Colors.amber.shade300;
      break;
    case Accuracy.awful:
      return Colors.red.shade300;
      break;
    default:
      return Colors.black;
      break;
  }
}

IconData resultIcon(double guess, double result) {
  if (result - guess < 0) return Icons.arrow_downward;

  if (result - guess > 0) return Icons.arrow_upward;

  return Icons.done;
}

String accuracyText(Accuracy acc, double guess, double result) {
  if (acc == Accuracy.perfect)
    return '...pretty much exactly what you thought! Well done!';

  bool over = (result - guess) < 0;

  if (over) return 'less than you thought!';

  return 'more than you thought!';
}
