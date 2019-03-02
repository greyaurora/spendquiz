import 'package:flutter/material.dart';

import 'payment.dart';
import 'cash_field.dart';

class AmountField extends StatelessWidget {
  final String label;

  const AmountField({
    Key key,
    this.label = 'How much did you spend?',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.primaryDelta < -10.0) {
          Payment.of(context).resetAmount();
          FocusScope.of(context).requestFocus(FocusNode());
        }
      },
      child: Column(
        children: <Widget>[
          label == null ? Container() : Text(label, style: TextStyle(fontSize: 20)),
          Row(
            children: <Widget>[
              SizedBox(width: 48.0),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text('\$', style: Theme.of(context).textTheme.display3),
                    Expanded(child: CashField(AmountType.dollars)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Text('.', style: Theme.of(context).textTheme.display3),
                    Expanded(child: CashField(AmountType.cents)),
                  ],
                ),
              ),
              SizedBox(width: 48.0),
            ],
          ),
        ],
      ),
    );
  }
}
