import 'package:flutter/material.dart';

import '../utils/result.dart';

class QuizResult extends StatelessWidget {
  final double guess;
  final double result;

  const QuizResult({Key key, this.guess, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Accuracy acc = measureAccuracy(guess, result);
    String diff = (result - guess).abs().toStringAsFixed(2);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text('You spent:', style: TextStyle(fontSize: 22)),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: resultColor(acc),
              width: 6,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                resultIcon(guess, result),
                color: resultColor(acc),
              ),
              Text(
                '\$$diff',
                style: TextStyle(
                  fontSize: 56,
                  color: resultColor(acc),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            accuracyText(acc, guess, result),
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'You guessed: \$${guess.toStringAsFixed(2)}\n'
              'You spent: \$${result.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
