import 'package:flutter/material.dart';

import 'payment.dart';
import 'package:spend_quiz/src/widgets/amount_button_row.dart';
import 'package:spend_quiz/src/widgets/amount_field.dart';
import 'package:spend_quiz/src/widgets/type_picker.dart';

class Spend extends StatefulWidget {
  @override
  _SpendState createState() => _SpendState();
}

class _SpendState extends State<Spend> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AmountField(),
              Row(
                children: <Widget>[
                  SizedBox(width: 48),
                  Expanded(child: AmountButtonRow(AmountType.dollars)),
                  Expanded(child: AmountButtonRow(AmountType.cents)),
                  SizedBox(width: 48),
                ],
              ),
            ],
          ),
        ),
        Text(
          'What\'d you buy?',
          style: TextStyle(fontSize: 20),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 80),
            child: TypePicker(),
          ),
        ),
      ],
    );
  }
}
