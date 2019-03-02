import 'package:flutter/material.dart';

import '../models/date_ranges.dart';
import '../models/payment_types.dart';
import '../utils/db.dart';
import '../theme/theme.dart';
import 'quiz_result.dart';

class QuizResultDialog extends StatelessWidget {
  final double amount;
  final PaymentType type;
  final DateRange range;

  const QuizResultDialog({
    Key key,
    @required this.amount,
    @required this.type,
    @required this.range,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPaymentTotal(
        start: ranges(range)[0],
        end: ranges(range)[1],
        type: type?.index,
      ),
      builder: (context, snapshot) {
        Widget content;

        if (!snapshot.hasData) {
          content = Center(child: CircularProgressIndicator());
        } else {
          content = QuizResult(
            guess: amount,
            result: snapshot.data,
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 72,
          ),
          child: Material(
            borderRadius: BorderRadius.circular(24),
            child: Theme(
              data: mainTheme,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[content],
              ),
            ),
          ),
        );
      },
    );
  }
}
